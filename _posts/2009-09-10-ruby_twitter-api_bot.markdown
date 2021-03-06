---
layout: post
status: publish
published: true
title: rubyからtwitter APIを利用してbotを作る
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 57
wordpress_url: http://tjun.jp/blog/2009/09/ruby%e3%81%8b%e3%82%89twitter-api%e3%82%92%e5%88%a9%e7%94%a8%e3%81%97%e3%81%a6bot%e3%82%92%e4%bd%9c%e3%82%8b/
date: 2009-09-10 20:40:00.000000000 +09:00
categories:
- ruby
- twitter
tags:
- twitter
- ruby
comments: []
---
rubyからtwitter APIをたたくbotを作ります。

今回は、

「受け取ったダイレクトメッセージを、そのままpostするbot」

を作ります。

以前はtwitter4Rというgemを使っていたけど、それが正しく動かなくなったので、

<a href="http://twitter.rubyforge.org/">Ruby Twitter Gem by John Nunemaker</a>

を使います。

ドキュメントは

<a href="http://rdoc.info/projects/jnunemaker/twitter">rdoc.info :: twitter</a>

に詳しいです。

で、ソースコード。

{% highlight ruby linenos %}
require 'rubygems'
require 'twitter'

#twitter conf
username = ''
password = ''
httpauth = Twitter::HTTPAuth.new(username, password)
client = Twitter::Base.new(httpauth)

client.direct_messages.each{ |msg|
  post_msg = msg.text.strip
  client.update(post_msg)
  client.direct_message_destroy(msg.id)
}
{% endhighlight %}

これをcronで毎分動かしてやります．
以上です。今のところ正しく動いています。

<span style="color: #ff0000;"><strong>--- 2010/07/10 追記 ---
この記事は古いですが、今ならOauthの認証を使うべきです。</strong></span>
<ul>
	<li><span style="color: #ff0000;"><strong><a href="http://d.hatena.ne.jp/shibason/20090802/1249204953">TwitterのbotをOAuthに対応させる - しばそんノート</a></strong></span></li>
</ul>
<span style="color: #ff0000;"><strong>この記事なんかが参考になります。</strong></span>
