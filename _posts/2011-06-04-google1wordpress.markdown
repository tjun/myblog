---
layout: post
status: publish
published: true
title: google+1ボタンをwordpressに
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 855
wordpress_url: http://tjun.jp/blog/?p=855
date: 2011-06-04 10:48:36.000000000 +09:00
categories:
- web
- wordpress
tags:
- google
- wordpress
comments: []
---
<a href="http://www.flickr.com/photos/51035743246@N01/5419191480/" title="Google Supply Chain Operations" target="_blank"><img src="http://farm6.static.flickr.com/5293/5419191480_0c225bb14a_m.jpg" alt="Google Supply Chain Operations" border="0" /></a><br /><small> <a href="http://www.photodropper.com/photos/" target="_blank">photo</a> credit: <a href="http://www.flickr.com/photos/51035743246@N01/5419191480/" title="Dawn Endico" target="_blank">Dawn Endico</a></small>
<a href="http://www.google.com/+1/button/">googleの+1ボタン</a>をwordpressのブログに設置しよう！

<a href="http://www.google.com/webmasters/+1/button/index.html">google+1のwebmaster向けサイト</a>からコードをコピーして使います。

そのまま使ってもいいのですが、ページのURLを含めることもできるので、wordpressに合わせたページのURLも含めるコードに変えましょう。
以下のコードを、single.phpの表示したい場所に入れれば動くと思います。


普通のサイズ
<script type="text/javascript" src="http://apis.google.com/js/plusone.js"></script>
<g:plusone href="http://tjun.jp/blog/2011/06/google1wordpress/"></g:plusone>
{% highlight javascript %}
<!-- google+1 -->
<script type="text/javascript" src="http://apis.google.com/js/plusone.js"></script>
<g:plusone href="<?php the_permalink() ?>"></g:plusone>
{% endhighlight %}

小さいサイズ
<script type="text/javascript" src="http://apis.google.com/js/plusone.js"></script>
<g:plusone size="small" href="http://tjun.jp/blog/2011/06/google1wordpress/"></g:plusone>
{% highlight javascript %}
<!-- google+1 -->
<script type="text/javascript" src="http://apis.google.com/js/plusone.js"></script>
<g:plusone size="small" href="<?php the_permalink() ?>"></g:plusone>
{% endhighlight %}


以上です。
