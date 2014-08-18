update peanuthull DDNS
======================

更新花生壳 DDNS。

    Usage:
        ph-ddns.sh [config]

定时运行可以使用 crontab, 10-15分钟比较合适。

    crontab -e
    15 * * * * /path/to/ph-ddns.sh


Install
-------

    git clone git@github.com:kenchou/ph-ddns.git
    cp config.sample config


Configuration
-------------

    IP_URL        获取公网IP的服务
    AUTHROIZATION 花生壳的身份认证 Key，username:password 做 base64 encode
    DEBUG         非0输出更多的信息

