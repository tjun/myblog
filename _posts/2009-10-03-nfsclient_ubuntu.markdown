--- 
layout: post
title: "ubuntu\xE3\x81\xA7nfs\xE3\x82\xAF\xE3\x83\xA9\xE3\x82\xA4\xE3\x82\xA2\xE3\x83\xB3\xE3\x83\x88\xE3\x81\xAE\xE8\xA8\xAD\xE5\xAE\x9A"
wordpress_id: 77
wordpress_url: http://tjun.jp/blog/2009/10/ubuntu%e3%81%a7nfs%e3%82%af%e3%83%a9%e3%82%a4%e3%82%a2%e3%83%b3%e3%83%88%e3%81%ae%e8%a8%ad%e5%ae%9a/
date: 2009-10-03 19:51:39 +09:00
---
nfsというのは、ネットワーク越しに他のサーバのディレクトリなどをマウントして、ファイルを共有する仕組みです。
マウントされる側のホストと、マウントする側のクライアントがいます。クライアントは複数いても大丈夫です。

<h2>まずは，ホストサーバ側の設定</h2>

/etc/exportsに
マウントしたいディレクトリ　許可するサーバ:ipなどで記述(option)
を書きます．
<pre>/etc/exports</pre>
<pre>
[マウントしたいディレクトリ] [許可するIP](オプション)</pre>
/home/tjun/share 192.168.18.10(rw,sync)
/home/share 192.168.0.0/255.255.255.0(ro,sync)
</pre>

こんな感じ。許可するサーバとオプションの間にスペースがあったらだめらしい．
オプションは、rwで読み書き、roでリードオンリー、など設定できます。

<h2>クライアント</h2>
クライアントのubuntuでは
まずnfsクライアントをインストール．
<pre>$ sudo apt-get install nfs-common</pre>


自動でマウントするようにしたいため，
/etc/fstab
に１行追加します．追加するのは，

マウントする対象のサーバ:ディレクトリ　マウント先のディレクトリ　nfs オプション 0 0
<pre>[hostのipなど]:/home/tjun/share /home/share nfs rw,soft 0 0</pre>
こんな感じ．

そして，
<pre>$ sudo mount -a</pre>
これでマウントされるはず.


オプション等は以下のサイトに詳しく解説されていました。
<ul>
	<li><a href="http://itmst.blog71.fc2.com/blog-entry-89.html">Electronic Genome - Ubuntu + NFSサーバでファイル共有</a></li>
</ul>
