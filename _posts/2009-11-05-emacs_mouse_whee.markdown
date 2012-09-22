---
layout: post
status: publish
published: true
title: emacsでのホイールスクロールを控えめに
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 111
wordpress_url: http://tjun.jp/blog/?p=111
date: 2009-11-05 01:46:20.000000000 +09:00
categories:
- mac
tags:
- mac
- emacs
comments:
- id: 6
  author: Magic Mouseゲットした | tjun blog
  author_email: ''
  author_url: http://tjun.jp/blog/2009/11/magic-mouse/
  date: '2009-11-05 01:54:55 +0900'
  date_gmt: '2009-11-04 16:54:55 +0900'
  content: ! '[...] emacsでのホイールスクロールを控えめに [...]'
---
Macの新しいマウス（Magic Mouse ）を導入してから，emacsを使うときにスクロールしすぎてしまうので，それを止めるための設定をした．

参考にしたのは
<a href="http://d.hatena.ne.jp/paella/20080930/1222761237">マウスのホイールスクロールを加速させたくない - Ni chicha, ni limona -平均から抜けられない僕-</a>

.emacs.elに以下を追加します．

[code]
(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 3))
(defun scroll-up-with-lines ()
  "" (interactive) (scroll-up 3))
(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
(global-set-key [double-wheel-up] 'scroll-down-with-lines)
(global-set-key [double-wheel-down] 'scroll-up-with-lines)
(global-set-key [triple-wheel-up] 'scroll-down-with-lines)
(global-set-key [triple-wheel-down] 'scroll-up-with-lines)
[/code]

これで快適になりました．
