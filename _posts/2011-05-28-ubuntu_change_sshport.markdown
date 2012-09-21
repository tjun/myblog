--- 
layout: post
title: "Ubuntu\xE3\x81\xA7ssh\xE3\x81\xAE\xE3\x83\x9D\xE3\x83\xBC\xE3\x83\x88\xE3\x82\x92\xE5\xA4\x89\xE6\x9B\xB4\xE3\x81\x99\xE3\x82\x8B"
wordpress_id: 818
wordpress_url: http://tjun.jp/blog/?p=818
date: 2011-05-28 12:05:15 +09:00
---
sshポートをデフォルトの22にしていると攻撃を受けるので、変えましょう。

変える先のポート番号は、10000~65534の間で適当な番号がよいと思います。
また、<pre>
$ netstat -an
</pre>
を見て、使われていないポートにしましょう。

設定の変更
<pre>
$ vi /etc/ssh/sshd_config
</pre>
で、新たなポート番号を設定します。
<pre>
# What ports, IPs and protocols we listen for
#Port 22
Port 24242
</pre>

そして、sshdを再起動して設定を反映
<pre>
$ sudo /etc/init.d/ssh restart</pre>

次回からssh接続するときは
<pre>$ ssh xxx.xxx.xxx.xxx -p 24242</pre>
のようにポートを指定します。
