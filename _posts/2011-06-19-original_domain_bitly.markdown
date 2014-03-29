---
layout: post
status: publish
published: true
title: 独自ドメインの短縮URLを使う
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 900
wordpress_url: http://tjun.jp/blog/?p=900
date: 2011-06-19 15:07:13.000000000 +09:00
categories:
- web
tags:
- webservice
- twitter
comments: []
---
最近<a href="http://bitly.com/">bitly</a>のPRO機能が無料になりました。
<a href="http://jp.techcrunch.com/archives/20110615bitly-makes-its-bitly-pro-features-free-to-all-users/">Bitly Pro機能が無料に―独自ドメイン名で短縮ができる</a>

これで自分のドメインがあれば、それを使って独自の短縮URLが使えます。

こんな感じ

    http://z.tjun.jp/cdomain  

スラッシュ以下を好きな文字列にすることもできます（これは元からかも）



ここでは、さくらインターネットで取得したドメインの場合の設定を紹介します。


<h2>bit.lyの設定</h2>
<a href="http://bitly.com/">Bitly</a>の<a href="http://bitly.com/a/account">設定ページ</a>から、「<a href="http://bitly.com/a/custom_domain_settings">Modify Custom Short Domain Settings</a>」をクリック。

これで、独自ドメインを設定できるので、自分の場合は持っていたtjun.jpというドメインのサブドメインで、適当にz.tjun.jpにしました。

<h2>さくらインターネットの設定</h2>
次に<a href="https://secure.sakura.ad.jp/menu/top/index.php">さくらインターネットの会員メニュー</a>から「契約情報」のタブを選んで、「ドメインメニュー」を選択します。

<a rel="attachment" href="http://tjun.jp/blog/img/2011/06/keiyaku-300x206.jpg"><img src="http://tjun.jp/blog/img/2011/06/keiyaku-300x206.jpg" title="keiyaku" width="300" height="206" class="aligncenter size-medium" /></a>

そこから、設定したいドメインの「ゾーン設定」の変更を選択して、サブドメインとそのCNAME、そして値を入力します。値には、<span style="color: #ff0000;">cname.bitly.com.</span>を入れます。<span style="color: #ff0000;"><strong>最後のcomの後ろにもドットがつくので注意。</strong></span>

<a rel="attachment wp-att-903" href="http://tjun.jp/blog/img/2011/06/zone-setting-300x182.jpg"><img src="http://tjun.jp/blog/img/2011/06/zone-setting-300x182.jpg" title="zone-setting" width="300" height="182" class="aligncenter size-medium wp-image-903" /></a>

これで、左のほうのメニューにある「データ送信」をクリックして、設定が反映されるのを待ちます。
（結構時間がかかると思います。）

で、bitlyの方でそれが確認出来れば、下の図のように独自ドメインが選択できるようになります。

ここで設定して、twitterクライアントなどからAPIを叩けば反映されているのが分かります。
もちろん今までと同じようにクリック数などを見ることもできます。

<strong>追記</strong>
でもなんか恥ずかしいので自分は結局もとのbit.lyドメインに戻しました。
設定を元に戻しても反映されるのにすごく時間がかかるから注意
