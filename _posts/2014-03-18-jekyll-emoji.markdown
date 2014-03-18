---
layout: post
category: jekyll
title: jekyllでgithubみたいに絵文字を使う
date: 2014-03-18
description: jekyllのblogでgithubのように絵文字を使う方法
keywords: jekyll, emoji
---

こんな感じ。

:+1::meat_on_bone::hotsprings::octocat::bug::ok_woman:

githubの絵文字が使えます。
以下の絵文字のリストから文字列コピーして貼り付けるだけ。

* [Emoji cheat sheet for Campfire and GitHub](http://www.emoji-cheat-sheet.com/)


[jemoji](https://github.com/jekyll/jemoji)というのを使います。

`Gemfile`に

    gem 'jemoji'

追加して`bundle install`して、`_config.yml`に以下を追加するだけで使える。簡単！

    gems:
      - jemoji

まあ使わないかな:man_with_gua_pi_mao:


