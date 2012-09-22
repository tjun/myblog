---
layout: post
status: publish
published: true
title: safariでMakelink
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 161
wordpress_url: http://tjun.jp/blog/?p=161
date: 2009-12-03 04:58:47.000000000 +09:00
categories:
- mac
tags:
- mac
- safari
comments: []
---
Firefoxで使ってたmakelink。

ブログとか書くときに便利だからsafariでもなんとかしたい。
safariで実現する方法は、いくつかあると思うんだけど、前に入れたやつはうまく動かなかったのでbookmarkletでやることにしました。

<a title="さよならFirefox　気づいたらGoogleChromeがデフォルトブラウザだった件|MOBILE POWER　?読書とかiPhoneとか? - livedoor Blog（ブログ）" href="http://blog.livedoor.jp/sakusakupocky/archives/50315174.html">さよならFirefox　気づいたらGoogleChromeがデフォルトブラウザだった件|MOBILE POWER　?読書とかiPhoneとか? - livedoor Blog（ブログ）</a>
を参考にさせていただいて、のままコピペしたらいけるかな、と思ったら、いけなかった。

ブログ本文の方はタグがhtmlと解釈されてしまっているし、ソースコピペしてもどうもダブルクオーテーションがうまく反映されず、使えない。

というわけで少し修正してみました。
自分ではうまく使えているけど、ブログに載せる際に正しく反映されるかな。
[code]
javascript:var url = location.href;var title = document.title;var linkTag = ' <a href="' + url + '" title="' + title + '">' + title +'</a>';var x = prompt('',linkTag);
[/code]
どうでしょう。
