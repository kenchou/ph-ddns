Update peanuthull DDNS
======================

```
注：由于花生壳需要实名认证，作者已经放弃花生壳服务。本项目不再维护。
```

更新花生壳 DDNS。

    Usage:
        ph-ddns.sh [config]

如果未指定配置文件，本程序默认读取同目录下的 config 文件。

定时运行可以使用 crontab, 一般定 10-15 分钟比较合适。


    crontab -e
    */10 * * * * /path/to/ph-ddns.sh

/path/to/ 改为你的 ph-ddns.sh 所在路径。

关于 crontab 配置文件的格式，请参阅 linux man 手册 `man 5 crontab`


Install
-------
克隆项目

    git clone git@github.com:kenchou/ph-ddns.git

创建配置文件

    cd ph-ddns
    cp config.sample config

按下面方法修改配置文件

Configuration
-------------

配置 | 说明
----|-----
IP_URL | 获取公网IP的服务
AUTHROIZATION | 花生壳的身份认证 Key，username:password 做 base64 encode, 详情见 [文档:花生壳:http协议说明](http://service.oray.com/question/3820.html)
DEBUG | 非0输出更多的信息
