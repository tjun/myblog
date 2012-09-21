--- 
layout: post
title: "emacs\xE3\x81\xA7\xE3\x81\xAE\xE3\x83\x9B\xE3\x82\xA4\xE3\x83\xBC\xE3\x83\xAB\xE3\x82\xB9\xE3\x82\xAF\xE3\x83\xAD\xE3\x83\xBC\xE3\x83\xAB\xE3\x82\x92\xE6\x8E\xA7\xE3\x81\x88\xE3\x82\x81\xE3\x81\xAB"
wordpress_id: 111
wordpress_url: http://tjun.jp/blog/?p=111
date: 2009-11-05 01:46:20 +09:00
---
Macの新しいマウス（Magic Mouse ）を導入してから，emacsを使うときにスクロールしすぎてしまうので，それを止めるための設定をした．

参考にしたのは
<a href="http://d.hatena.ne.jp/paella/20080930/1222761237">マウスのホイールスクロールを加速させたくない - Ni chicha, ni limona -平均から抜けられない僕-</a>

.emacs.elに以下を追加します．

[code]
(defun scroll-down-with-lines ()
  &quot;&quot; (interactive) (scroll-down 3))
(defun scroll-up-with-lines ()
  &quot;&quot; (interactive) (scroll-up 3))
(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
(global-set-key [double-wheel-up] 'scroll-down-with-lines)
(global-set-key [double-wheel-down] 'scroll-up-with-lines)
(global-set-key [triple-wheel-up] 'scroll-down-with-lines)
(global-set-key [triple-wheel-down] 'scroll-up-with-lines)
[/code]

これで快適になりました．
