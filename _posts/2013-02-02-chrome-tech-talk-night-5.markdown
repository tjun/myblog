---
layout: post
category: 
title: Chrome Tech Talk Night 5 にいってきました
date: 2013-02-01
description: 
keywords: chrome, web, server
---

ちょっと興味があるテーマだったので、[Chrome Tech Talk Night #5](http://googledevjp.blogspot.jp/2013/01/chrome-tech-talk-night-5.html) に参加してきました。(2013/1/31)

そのときのメモです。
会場はGoogle Japan。



スピーカーは Ilya Grigorik さんで、Performance Enthusiast と紹介されていました。

話は２つに分かれていて、前半はpagespeedを使ったサーバサイドでの高速化の話で、後半はchrome devtoolの説明と使い方という、クライアント側のデータから高速化を考える話でした。

詳しい内容は、発表のスライドや動画を見るのがよいと思います。

前半のスライド

* [{mod,ngx}_pagespeed: what, why, and how it works - Google Drive](https://docs.google.com/presentation/d/1NidHQ-HAWpgQiYJ44gOfgcp_FQ2u59WE4eHuSvwddXY/edit#slide=id.p19)

後半のスライド

* [Wait, DevTools could do THAT?](http://www.igvita.com/slides/2012/devtools-tips-and-tricks/#1)

動画と、まとまってそうなレポート

* [ Chrome Tech Talk Night #5 - Google+](https://plus.google.com/events/c8q2ks2ejetp3nlrq1jcehf4f44)
* [Chrome Tech Talk Night #5レポート【 メモ】 ｜ クラスメソッド開発ブログ](http://dev.classmethod.jp/server-side/server/chrometechnite5-repo/)
* [Fumi's Travelblog: Chrome Techtalk Night #5 #chromejp](http://fumit.blogspot.jp/2013/02/chrome-techtalk-night-5-chromejp.html)

また、関連する話がちょうど同じ日にpostされていたので、それも合わせて読むといいかもです。

* [High Performance Networking in Google Chrome - igvita.com](http://www.igvita.com/posa/high-performance-networking-in-google-chrome/)

## pagespeed

前半は、pagespeedの紹介と、Apacheやnginxでどんな感じで使えるのか、またpagespeedの中ではどんなことをやっているのか、という話と、少しSPDYの話がありました。

Apacheには[mod_pagespeed](https://developers.google.com/speed/pagespeed/mod)、nginxには [ngx_pagespeed](https://github.com/pagespeed/ngx_pagespeed) が既にあって、nginxの方はまだalphaだけど使えます。pagespeedにはいくつかfilterがあって、安全に使えるCore filterと、サイトによっては少し問題が出るかもしれないOptionalなfilterがあります。filterをテストしながらOn/Offしていけば簡単に高速化ができます。
それぞれのfilterは、例えば画像のリサイズして圧縮したり、複数のCSSを１つにまとめたり、ということをpagespeedが勝手に良い感じにやってくれます。

SPDYの紹介も少しあって、HTTP2.0もSPDYに近いものになるんじゃないか、ということでした。
HTTP2.0には3つのpointがあって

1. Make things better
- 今のHTTP1.1にはよくない部分があって、みんないろいろな工夫をしてる。HTTP2.0はそこが改善される

2. Build on HTTP1.1
- 今のHTTP1.1と互換性を持って、今の仕組みの上で動く必要がある
 
3. Be extensuble
- 将来的な拡張性も必要だよね

というような話でした。
Apache向けにはmod-spdyを使えばSPDY対応できます。



pagespeedの名前は知っていたけど、中でどんなことをやっているのか、という話を聞けて勉強になりました。ちょっとngx_pagespeedを試してみようと思います。


## Devtools

後半は、Devtoolはどんなことができるのか、network的なperformanceだけでなくrenderingのperformanceも見れること、いろいろなデータがexportできること、androidにつないでmobile 向けのdebugもできること、どんなカスタマイズができるか、などの話がありました。

DevTools自体がWeb pageなので、いろいろカスタマイズしたりDevToolからのデータを取得したり、ということができるようになっているらしいです。


DevToolsも少し使ったことあるくらいであまり知らなかったので、いろいろな機能が聞けてよかったです。あとは、chrome://net-internalsでSPDYの情報が見れるとか、そういったDevTools以外のchromeの機能についても聞けました。


