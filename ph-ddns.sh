#!/bin/bash
# Update peanuthull DDNS
# author: Ken Chou <kenchou77@gmail.com>
# Usage:
#    ph-ddns.sh
#    ph-ddns.sh another/config

BIN_PATH=`dirname "$0"`
CONFIG_FILE=${1:-$BIN_PATH/config}
# include config file
. $CONFIG_FILE

CMD_GET_IP="curl -s $IP_URL"
[[ $DEBUG -ne 0 ]] && echo $CMD_GET_IP

IP=`$CMD_GET_IP`
[ $? -ne 0 ] && echo "Oops. Cannot get extenal IP!" && exit 1

if [[ ( -f "$OLD_IP" ) && ( "$IP" = "`cat $OLD_IP`" ) ]]
then
    # IP No Change.
    [[ $DEBUG -ne 0 ]] && echo "$IP IP No change."
    exit 0
fi

# update DDSN
echo "Run @ `date '+%F %R:%S'`"
echo "Updating DDNS... Current IP: $IP"

AUTH_HEADER="Authorization: Basic ${AUTHORIZATION}"
CMD_UPDATE_DDNS=( curl -s -H "${AUTH_HEADER}" -A "${USERAGENT}" "${DDNS_UPDATE_URL}${IP}" )
[[ $DEBUG -ne 0 ]] && echo ${CMD_UPDATE_DDNS[@]}

RESULT=`"${CMD_UPDATE_DDNS[@]}"`
[ $? -ne 0 ] && echo "Update Error." $RESULT && exit 1 || echo $RESULT

# save current ip
echo $IP > $OLD_IP
