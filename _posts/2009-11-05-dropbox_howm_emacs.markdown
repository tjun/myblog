---
layout: post
status: publish
published: true
title: Dropboxでhowmのメモを共有する.emacs
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 125
wordpress_url: http://tjun.jp/blog/?p=125
date: 2009-11-05 02:30:23.000000000 +09:00
categories:
- tips
tags:
- emacs
comments: []
---
howmで作られるメモをDropboxで共有するには，.emacs.elに

<pre>
(setq howm-directory "~/Dropbox/memo/howm/")
</pre>
を書きます．

ディレクトリは適宜書き換えてください．
