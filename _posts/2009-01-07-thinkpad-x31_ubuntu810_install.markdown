---
layout: post
status: publish
published: true
title: Thinkpad X31にUbuntu8.10インストールメモ
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 404
wordpress_url: http://zzz.jeeet.net/?p=237
date: 2009-01-07 23:44:42.000000000 +09:00
categories:
- linux
- tips
- ubuntu
tags:
- ubuntu
comments: []
---
新たにLinuxマシンを使う必要があったので，古いthinkpadにUbuntu8.10を入れて使うことにした．

つまづいたところがいくつか。

・<strong>Ubuntuのisoイメージを焼いたDVD（またはCD）ブートの際認識されない</strong>

&rarr;これはたいていディスクにちゃんとイメージとして焼けてないことが原因です．
isoを焼けるソフトを探してきて焼きましょう．
ちなみに自分はDVDDecrypterというソフトを使ってDVD-Rに焼きました．

で、インストール．
BIOSとかインストールの際のパーティションなどは初心者にはちょっと難しいですが，他のサイトを参考に注意深くやってください．


<h3>インストール後につまづいたこと</h3>

・<strong>ネットワークにつながらない</strong>

ケーブル挿したらネットワークにつなごうとはするんだけど、なぜか繋がらない。
これは他に原因があるっぽいのであきらめて、無線LANでつなぐことを考える。

無線LANのランプがついていないので、ドライバがないのかな、と考える．

googleでちょっと検索して、

<a href="http://geocities.yahoo.co.jp/gl/jgkmm554/view/20081101/1225540934">Thinkpad R30 に ubuntu 8.10 ja をインストール　まずは無線LAN</a>

を参考にして、インストールのときに使ったLiveDVDを入れます．

メニューバー?の「システム」&rarr;「システム管理」&rarr;「Synaptic パッケージマネージャ」を開いて
「設定」&rarr;「リポジトリ」のに下の方の「CD-ROM/DVDからインストール」の「Ubuntu8.10 'Intrepid Ibex'のCD-ROM」チェックを入れ、OKを押してから、一度Synpaticパッケージマネージャを終了させます。

そして、再びSynpaticパッケージマネージャを起動し，「未インストール」の中から
「linux-backports-modules-intrepid-generic」をダブルクリックとかして、選択します．

同時に?も入れてください　っていうのもOKして、「適用」を押すと、インストールが始まります．

それが終わったらPCを再起動してください。
きっとこれで無線LANが使えるようになります。



・<strong>無線がWPAだとパスワードが通らない</strong>
&rarr;なぜか入力したパスワードがバグっちゃうみたい。
とりあえず別の無線LAN(WEP)で妥協した。
&rarr;結局，メニューバー?のネットワークのアイコン右クリックして「接続の編集」から対象となるネットワークを選んで「無線セキュリティ」からパスワード入力したら接続できた。
謎。
Fonの場合は，ちょっと違うらしい．

・<strong>音量の調節ができない</strong>
&rarr;未解決。スクロールするたびに変な音がなるのは消した。
「システム設定」&rarr;「サウンド」から。

・<strong>トラックポイントとセンターボタンによるスクロールができない</strong>
&rarr;<a href="http://d.hatena.ne.jp/sun-basix/20081029/1225287044">Ubuntu Intrepid (8.10)でThinkPadのトラックポイントを有効にする</a>を参考に，
/etc/hal/fdi/policy/mouse-wheel.fdi
を作成する．
昔と設定方法が変わったので要注意。

で、PC再起動したらスクロールできるようになります。

とりあえず以上です．
<iframe src="http://rcm-jp.amazon.co.jp/e/cm?t=tjun-22&o=9&p=8&l=as1&asins=0596527209&md=1X69VDGQCMF7Z30FM082&fc1=000000&IS2=1&lt1=_blank&m=amazon&lc1=0000FF&bc1=000000&bg1=FFFFFF&f=ifr" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe><iframe src="http://rcm-jp.amazon.co.jp/e/cm?t=tjun-22&o=9&p=8&l=as1&asins=4774133736&md=1X69VDGQCMF7Z30FM082&fc1=000000&IS2=1&lt1=_blank&m=amazon&lc1=0000FF&bc1=000000&bg1=FFFFFF&f=ifr" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe><iframe src="http://rcm-jp.amazon.co.jp/e/cm?t=tjun-22&o=9&p=8&l=as1&asins=4048675168&md=1X69VDGQCMF7Z30FM082&fc1=000000&IS2=1&lt1=_blank&m=amazon&lc1=0000FF&bc1=000000&bg1=FFFFFF&f=ifr&nou=1" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe><iframe src="http://rcm-jp.amazon.co.jp/e/cm?t=tjun-22&o=9&p=8&l=as1&asins=479734377X&md=1X69VDGQCMF7Z30FM082&fc1=000000&IS2=1&lt1=_blank&m=amazon&lc1=0000FF&bc1=000000&bg1=FFFFFF&f=ifr&nou=1" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
