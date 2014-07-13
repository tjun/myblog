---
layout: post
category:
title: VoiceText Web APIをrubyから使う
date: 2014-07-11
description:
keywords: audio, voice
---

[VoiceText Web API](https://cloud.voicetext.jp/webapi)というのがあることを知ったので、使ってみました。

利用登録したらAPIキーがメールで届きます、APIキーが必要になります。

APIは下記のページに説明があります。

- [VoiceText Web API](https://cloud.voicetext.jp/webapi/docs/api)

話者や感情が幾つか選べるし、話す速度も調整できる。

　

gemでも作ろうかなと思ったらもうありました。

* [tsuwatch/voicetext](https://github.com/tsuwatch/voicetext)

次のような感じで使えます。
{% highlight ruby %}
#!/usr/bin/env ruby
require 'voicetext'

voicetext = Voicetext.new('MY_API_KEY')

wav = voicetext.tts('台風8号、人造人間18号', 'hikari')
File.binwrite("test.wav", wav)
{% endhighlight %}

実行するとtest.wavができるので、Macならターミナルから

    $ afplay test.wav

とやると再生できます。 上の例のような漢字でも問題なく使えるし、いい感じです。

本当はここに上記のwavを貼り付けて再生できるようにしようと思ったのですが、利用規約に

> 当社のサーバーから出力された音声データを、直接的または間接的に配布しないこと

とあるのでやめておきます。
