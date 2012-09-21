--- 
layout: post
title: "safari\xE3\x81\xA7Makelink"
wordpress_id: 161
wordpress_url: http://tjun.jp/blog/?p=161
date: 2009-12-03 04:58:47 +09:00
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
javascript:var url = location.href;var title = document.title;var linkTag = ' &lt;a href=&quot;' + url + '&quot; title=&quot;' + title + '&quot;&gt;' + title +'&lt;/a&gt;';var x = prompt('',linkTag);
[/code]
どうでしょう。
