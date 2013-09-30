---
layout: post
status: publish
published: true
title: Ubuntuでsshのポートを変更する
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 818
wordpress_url: http://tjun.jp/blog/?p=818
date: 2011-05-28 12:05:15.000000000 +09:00
categories:
- server
- ubuntu
tags:
- ubuntu
- security
comments:
- id: 312
  author: Ubuntuのufwでファイアウォール設定 | tjun memo
  author_email: ''
  author_url: http://tjun.jp/blog/2011/05/ubuntu_ufw/
  date: '2011-05-28 12:08:31 +0900'
  date_gmt: '2011-05-28 03:08:31 +0900'
  content: ! '[...] Ubuntuでsshのポートを変更する | tjun memo   それが無理ならLIMITにしましょう。 LIMITは30秒間に6回アクセスしてきた
    IP の接続を一定時間拒否するという設定です。ブルートフォース対策です [...]'
---
sshポートをデフォルトの22にしていると攻撃を受けるので、変えましょう。

変える先のポート番号は、10000~65534の間で適当な番号がよいと思います。
また、

    $ netstat -an

を見て、使われていないポートにしましょう。

設定の変更

    $ vi /etc/ssh/sshd_config

で、新たなポート番号を設定します。

    # What ports, IPs and protocols we listen for
    #Port 22
    Port 24242

そして、sshdを再起動して設定を反映

    $ sudo /etc/init.d/ssh restart

次回からssh接続するときは

    $ ssh xxx.xxx.xxx.xxx -p 24242

のようにポートを指定します。
