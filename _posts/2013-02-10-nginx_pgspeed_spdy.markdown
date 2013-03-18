---
layout: post
category: server
title: nginxでpagespeedとSPDYを有効にする
date: 2013-02-10
description:
keywords: nginx,spdy,pagespeed
---

nginxをpagespeedとspdyに対応した時のメモ。

もともとこのブログはリソースの数も種類も少ないのであまり効果がないと思うけど(むしろ遅くなるかもしれない)、勉強と調査をかねてやってみた。今はデフォルトではオフにしてる。

間違っている部分があるかも。

pagespeedとSPDYの説明は、どっか見てください。


apacheのmod_pagespeedは安定してると思うが、nginx向けngx_pagespeedはまだ不安定な部分もあるらしいので、使う際には十分にテストした方がよいと思う。

apacheにはmod_spdyがあるが、nginxではパッチを当ててビルドすることで対応させることができる。

## インストール
環境は、ubuntu serverのたしか11.04で32ビット。

インストールの前に以下を入れる。

    sudo apt-get install git build-essential make zlib1g-dev libpcre3 libpcre3-dev

作業ディレクトリを作っていろいろ取ってくる。
nginxは、2013/02/01時点で最新だった1.3.11を使ってる。

    mkdir -p ~/ngx/src
    cd ~/ngx/src
    curl -O http://nginx.org/download/nginx-1.3.11.tar.gz
    git clone https://github.com/pagespeed/ngx_pagespeed.git
    curl -O http://www.openssl.org/source/openssl-1.0.1c.tar.gz
    tar zxf nginx-1.3.11.tar.gz
    tar zxf openssl-1.0.1c.tar.gz
    cd ./nginx-1.3.11

spdyパッチを当てる。

    curl -O http://nginx.org/patches/spdy/patch.spdy-58_1.3.11.txt
    patch -p1 < patch.spdy-58_1.3.11.txt

configure

    ./configure --add-module=${HOME}/ngx/src/ngx_pagespeed --with-openssl=${HOME}/ngx/src/openssl-1.0.1c --with-http_ssl_module --with-http_spdy_module

うまく行くと、こんな感じでどこにインストールされるのかが表示される。

    Configuration summary
    + using system PCRE library
    + using OpenSSL library: /home/tjun/local/src/openssl-1.0.1c
    + md5: using OpenSSL library
    + sha1: using OpenSSL library
    + using system zlib library
    nginx path prefix: "/usr/local/nginx"
    nginx binary file: "/usr/local/nginx/sbin/nginx"
    nginx configuration prefix: "/usr/local/nginx/conf"
    nginx configuration file: "/usr/local/nginx/conf/nginx.conf"
    nginx pid file: "/usr/local/nginx/logs/nginx.pid"
    nginx error log file: "/usr/local/nginx/logs/error.log"
    nginx http access log file: "/usr/local/nginx/logs/access.log"
    nginx http client request body temporary files: "client_body_temp"
    nginx http proxy temporary files: "proxy_temp"
    nginx http fastcgi temporary files: "fastcgi_temp"
    nginx http uwsgi temporary files: "uwsgi_temp"
    nginx http scgi temporary files: "scgi_temp"

makeする

    make

普通はこれでうまくいくみたいだけど、たくさんエラーでた。
`apr.h:***: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘apr_off_t’`のようなエラーがいっぱい出たら、

    CFLAGS="-D_LARGEFILE64_SOURCE" ./configure --add-module=${HOME}/local/src/ngx_pagespeed --with-openssl=${HOME}/local/src/openssl-1.0.1c --with-http_ssl_module --with-http_spdy_module

でconfigureからやりなおす。

makeが終わったら、`sudo make install` でconfigureのときに表示されたディレクトリにインストールされる。


## 設定

nginx.confを更新する。

### SPDYの設定

[nginx.org/patches/spdy/README.txt](http://nginx.org/patches/spdy/README.txt)を参考に、

    server {
      listen 443 ssl spdy;
      ssl_certificate /path/to/crt;
      ssl_certificate_key /path/to/key;
      # ...
    }

のような感じで、sslとともにspdyの設定を書く。

### pagespeedの設定

[pagespeed/ngx_pagespeed · GitHub](https://github.com/pagespeed/ngx_pagespeed)
を参考に、mainブロックか、serverブロックに以下のような感じで追加する。

    server {
      listen 8080;
      pagespeed on;
      pagespeed RewriteLevel CoreFilters;

      # needs to exist and be writable by nginx
      pagespeed FileCachePath /var/cache/ngx_pagespeed_cache;

      pagespeed EnableFilters collapse_whitespace,trim_urls;

      # This is a temporary workaround that ensures requests for pagespeed
      # optimized resources go to the pagespeed handler.
      location ~ "\.pagespeed\.([a-z]\.)?[a-z]{2}\.[^.]{10}\.[^.]+" { }
      location ~ "^/ngx_pagespeed_static/" { }
      location ~ "^/ngx_pagespeed_beacon$" { }

      ....
    }

という感じで追加する。
デフォルトで有効になっているフィルタの情報が見つからなかったので、mod_pagespeedと同じなのかな。[Configuring mod_pagespeed Filters - mod_pagespeed — Google Developers](https://developers.google.com/speed/docs/mod_pagespeed/config_filters)

その他のフィルターを有効にする場合には
`pagespeed EnableFilters collapse_whitespace,trim_urls;`の部分に、[ngx_pagespeed Examples Directory](http://ngxpagespeed.com/ngx_pagespeed_example/)を参考にして、追加する。

いくつか試してみたけど、image_rewriteなどは機能してないかもしれない。

## 確認

pagespeedを有効にして起動すると、以下のようなログが出る。
pagespeedを有効にしてnginxを起動すると、

以下のようなログが出る。

    Setting option from ("on")
    Setting option from ("RewriteLevel", "CoreFilters")
    Setting option from ("FileCachePath", "/var/cache/ngx_pagespeed_cash")
    Setting option from ("EnableFilters", "collapse_whitespace,trim_urls")

SPDYの確認は、chromeで SPDY indicatorを使っていれば、SPDYマークが出るので確認できる。
chrome://net-internals からも確認できる。

pagespeedの確認は、

    curl -s -D- 'http://localhost:8050/some_page/' | grep X-Page-Speed

で確認できる。

## 参考にしたサイト

* [nginx.org/patches/spdy/README.txt](http://nginx.org/patches/spdy/README.txt)
* [pagespeed/ngx_pagespeed · GitHub](https://github.com/pagespeed/ngx_pagespeed)
* [ngx_pagespeed Examples Directory](http://ngxpagespeed.com/ngx_pagespeed_example/)
* [SPDY の紹介と nginx で SPDY を使う方法 - HeartRails Tech Blog](http://techblog.heartrails.com/2013/01/using-spry-in-nginx.html)



