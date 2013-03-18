---
layout: post
status: publish
published: true
title: .htaccessでのBasic認証のユーザ名をphpで取得
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 391
wordpress_url: http://zzz.jeeet.net/?p=138
date: 2008-10-31 14:34:04.000000000 +09:00
categories:
- programming
tags:
- php
comments: []
---
phpでのBasic認証ではなく，.htaccessを用いたBasic認証をした際のユーザ名は，phpを用いると
<pre>
$_SERVER['REMOTE_USER']
</pre>
で取得できます．
phpでのBasic認証の場合は，
<pre>
$_SERVER['PHP_AUTH_USER']
</pre>
です．
<br />
