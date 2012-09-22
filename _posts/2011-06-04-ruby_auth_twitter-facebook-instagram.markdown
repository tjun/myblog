---
layout: post
status: publish
published: true
title: Rubyでtwitter, facebook, instagramなどの認証
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 851
wordpress_url: http://tjun.jp/blog/?p=851
date: 2011-06-04 10:54:21.000000000 +09:00
categories:
- ruby
- twitter
tags:
- twitter
- ruby
- oauth
comments: []
---
最近のソーシャルなサービスをアプリケーションと連携するには、Oauthで認証する必要があります。
これを自分で全部やるのは結構大変なので、ライブラリを使います。

RubyでOauthを使う場合、<a href="https://github.com/intridea/omniauth">Omniauth</a>というライブラリが便利です。
更新がこまめにされていて、対応できるサービスもtwitterをはじめgithubやlinkedinなどたくさんあり、instagramなどの新しいサービスにも対応できます。

使い方を紹介するのがちょっと大変なので、参考になりそうなサイトのリンクを貼っておきます。
<ul>
	<li><a href="http://railsapps.github.com/tutorial-rails-mongoid-omniauth.html">Rails 3 with Mongoid and OmniAuth - GitHub</a></li>
	<li><a href="http://www.communityguides.eu/articles/16">Ruby on Rails CommunityGuides: Omniauth pure: Authentication with Facebook, Google, Google Apps, Twitter, Github, AOL, MyOpenID, ...</a></li>
	<li><a href="http://taksatou.blogspot.com/2011/03/twitterfacebookrails.html">taksatouの日記: twitterやfacebookのOAuthをつかってrails+omniauthでログイン機能を実装するメモ その１</a></li>
</ul>
