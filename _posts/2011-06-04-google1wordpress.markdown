--- 
layout: post
title: "google+1\xE3\x83\x9C\xE3\x82\xBF\xE3\x83\xB3\xE3\x82\x92wordpress\xE3\x81\xAB"
wordpress_id: 855
wordpress_url: http://tjun.jp/blog/?p=855
date: 2011-06-04 10:48:36 +09:00
---
<a href="http://www.flickr.com/photos/51035743246@N01/5419191480/" title="Google Supply Chain Operations" target="_blank"><img src="http://farm6.static.flickr.com/5293/5419191480_0c225bb14a_m.jpg" alt="Google Supply Chain Operations" border="0" /></a><br /><small><a href="http://creativecommons.org/licenses/by-sa/2.0/" title="Attribution-ShareAlike License" target="_blank"><img src="http://tjun.jp/blog/wp-content/plugins/photo-dropper/images/cc.png" alt="Creative Commons License" border="0" width="16" height="16" align="absmiddle" /></a> <a href="http://www.photodropper.com/photos/" target="_blank">photo</a> credit: <a href="http://www.flickr.com/photos/51035743246@N01/5419191480/" title="Dawn Endico" target="_blank">Dawn Endico</a></small>
<a href="http://www.google.com/+1/button/">googleの+1ボタン</a>をwordpressのブログに設置しよう！

<a href="http://www.google.com/webmasters/+1/button/index.html">google+1のwebmaster向けサイト</a>からコードをコピーして使います。

そのまま使ってもいいのですが、ページのURLを含めることもできるので、wordpressに合わせたページのURLも含めるコードに変えましょう。
以下のコードを、single.phpの表示したい場所に入れれば動くと思います。


普通のサイズ
<script type="text/javascript" src="http://apis.google.com/js/plusone.js"></script>
<g:plusone href="http://tjun.jp/blog/2011/06/google1wordpress/"></g:plusone>
<pre>[code lang="JavaScrpt"]
&lt;!-- google+1 --&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;http://apis.google.com/js/plusone.js&quot;&gt;&lt;/script&gt;
&lt;g:plusone href=&quot;&lt;?php the_permalink() ?&gt;&quot;&gt;&lt;/g:plusone&gt;[/code]</pre>

小さいサイズ
<script type="text/javascript" src="http://apis.google.com/js/plusone.js"></script>
<g:plusone size="small" href="http://tjun.jp/blog/2011/06/google1wordpress/"></g:plusone>
<pre>[code lang="JavaSript"]
&lt;!-- google+1 --&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;http://apis.google.com/js/plusone.js&quot;&gt;&lt;/script&gt;
&lt;g:plusone size=&quot;small&quot; href=&quot;&lt;?php the_permalink() ?&gt;&quot;&gt;&lt;/g:plusone&gt;[/code]</pre>


以上です。
