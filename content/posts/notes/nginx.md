---
title: 'Nginx'
date: 2020-11-26
hero: /images/material/svg/1.svg
menu:
  sidebar:
    name: Nginx
    identifier: nginx
    parent: notes
    weight: 20
---

### Installation

```sh
wget http://nginx.org/download/nginx-1.19.5.tar.gz
tar xf nginx-1.19.5.tar.gz
cd nginx-1.19.5.tar.gz
./configure --with-http_v2_module --with-http_gzip_static_module --with-http_ssl_module
make
make install
cd where bin is
ln -s $(pwd)/nginx /usr/local/bin/nginx
```

### Command

```sh
nginx # 启动
nginx -s reload
nginx -s stop
nginx -V # 查看版本及加载的模块
```

### Enable https SSL HTTP/2

```sh
cd where install package is
./configure --with-http_ssl_module --with-http_v2_module
```

`server` in `default.conf`

```nginx
listen       443 ssl http2;
server_name  sso.*;

keepalive_timeout   70;

ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:ECDHE-RSA-AES128-GCM-SHA256:AES256+EECDH:DHE-RSA-AES128-GCM-SHA256:AES256+EDH:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-SHA256:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA:DES-CBC3-SHA:HIGH:!aNULL:!eNULL:!EXPORT:!DES:!MD5:!PSK:!RC4";
ssl_certificate     /root/nginx/cert/4740775_sso.sweetlove.top.pem;
ssl_certificate_key /root/nginx/cert/4740775_sso.sweetlove.top.key;
ssl_session_cache   shared:SSL:10m;
ssl_session_timeout 10m;
```

Chrome 打不开网站，报错 `ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY`

> 协议安全性不够，修改`default.conf`的`server`的`ssl_ciphers`

```nginx
ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:ECDHE-RSA-AES128-GCM-SHA256:AES256+EECDH:DHE-RSA-AES128-GCM-SHA256:AES256+EDH:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-SHA256:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA:DES-CBC3-SHA:HIGH:!aNULL:!eNULL:!EXPORT:!DES:!MD5:!PSK:!RC4";
```
