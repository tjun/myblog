--- 
layout: post
title: "fluentd\xE4\xBD\xBF\xE3\x81\xA3\xE3\x81\xA6dstat\xE3\x81\xAE\xE7\xB5\x90\xE6\x9E\x9C\xE3\x82\x92growthforecast\xE3\x81\xA7\xE8\xA1\xA8\xE7\xA4\xBA\xE3\x81\x99\xE3\x82\x8B"
wordpress_id: 1144
wordpress_url: http://tjun.jp/blog/?p=1144
date: 2012-06-03 23:29:40 +09:00
---
dstatでサーバの状態を取得して、fluentdで集めて、growthforecastでグラフにする、というのをやってみました。

<h3>dstat</h3>
dstatというのは、CPU使用率やメモリ使用量などなどの情報を手軽に取得できるツールです。
とっても簡単に使えます。
使い方は以下のサイトを参考にしてみてください。
<ul>
	<li><a href="http://www.sssg.org/blogs/naoya/archives/1554">dstat が便利 | Carpe Diem</a></li>
	<li><a href="http://d.hatena.ne.jp/hirose31/20120229/1330501968">dstatの万能感がハンパない - (ひ)メモ</a></li>
</ul>
まずはdstatが必要なのでインストールします。

dstatをfluentdにつなぐのに、<a href="https://github.com/shun0102/fluent-plugin-dstat">shun0102/fluent-plugin-dstat</a> を利用します。
ただ、outputのフォーマットがそのままgrowthforecastに入れるのにうまくつなげなかったので、少しいじって使いました。<a href="https://github.com/tjun/fluent-plugin-dstat">tjun/fluent-plugin-dstat</a>
できれば元のものをうまい具合にparseして繋ぎたいのだけど、やり方がよく分からなかった。。

設定はこんな感じ
<pre>&lt;source&gt;
  type dstat
  tag dstat
  option -cmdn delay 5
&lt;/source&gt;</pre>


<h3>growthforecast</h3>
growthforecastは、APIに投げたデータをグラフィカルにしてくれるツール。
<a href="http://blog.nomadscafe.jp/2011/12/growthforecast.html">GrowthForecastというグラフ表示ツールで捗る話 - blog.nomadscafe.jp</a>

これもまずはインストールします。
fluentdのpluginは<a href="http://fluentd.org/plugin/">Fluentd plugins</a> を使います。

設定はこんな感じ。
<pre>&lt;match dstat&gt;
  type copy
  &lt;store&gt;
    type growthforecast
    gfapi_url http://localhost:5000/api/
    service dstat
    section cpu
    name_key_pattern cpu-.*
  &lt;/store&gt;
  &lt;store&gt;
    type growthforecast
    gfapi_url http://localhost:5000/api/
    service dstat
    section mem
    name_key_pattern mem-.*
  &lt;/store&gt;
  &lt;store&gt;
    type growthforecast
    gfapi_url http://localhost:5000/api/
    service dstat
    section dsk
    name_key_pattern dsk-.*
  &lt;/store&gt;
  &lt;store&gt;
    type growthforecast
    gfapi_url http://localhost:5000/api/
    service dstat
    section net
    name_key_pattern net-.*
  &lt;/store&gt;
&lt;/match&gt;</pre>
すると、以下のような感じでCPU使用率やメモリ使用量が表示できるようになりました。

<a href="http://tjun.jp/blog/2012/06/fluentd-dstat-growthforecast/growthforecast-cpu/" rel="attachment wp-att-1150"><img src="http://tjun.jp/blog/wp-content/uploads/2012/06/GrowthForecast-cpu.jpg" alt="" title="GrowthForecast-cpu" width="472" height="208" class="aligncenter size-full wp-image-1150" /></a>
<a href="http://tjun.jp/blog/2012/06/fluentd-dstat-growthforecast/growthforecast-mem/" rel="attachment wp-att-1151"><img src="http://tjun.jp/blog/wp-content/uploads/2012/06/GrowthForecast-mem.jpg" alt="" title="GrowthForecast-mem" width="473" height="224" class="aligncenter size-full wp-image-1151" /></a>

同時に、nginxのアクセスログの集計もやって、アクセス数のグラフやリクエストタイムの割合のグラフも出してみました。

参考にしたサイト
<ul>
	<li><a href="http://d.hatena.ne.jp/studio3104/20120523/1337769639">#fluentdcasual に参加してきた - studio3104::Blog::Infrastructure</a></li>
</ul>

まずnginxのログフォーマットを少し変えました。
<pre>log_format main '$remote_addr - $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent" $request_time';</pre>

データの集計には、<a href="https://github.com/tagomoris/fluent-plugin-datacounter">tagomoris/fluent-plugin-datacounter</a>を使いました。

fluentdの設定は以下のような感じ。
<pre>&lt;source&gt;
  type tail
  format /^(?&lt;host&gt;[^ ]*) [^ ]* (?&lt;user&gt;[^ ]*) \[(?&lt;reqtime&gt;[^\]]*)\] "(?&lt;method&gt;[^ ]*) (?&lt;path&gt;[^ ]*) [^\"]*" (?&lt;code&gt;[^ ]*) (?&lt;size&gt;[^ ]*) "(?&lt;referer&gt;[^\"]*)" "(?&lt;agent&gt;[^\"]*)" (?&lt;response_time&gt;[^ ]*)$/
  path /var/log/nginx/access.log
  tag nginx.access
  pos_file /etc/fluent/nginx_pos
&lt;/source&gt;

# counter
&lt;match nginx.access&gt;
  type copy
  &lt;store&gt;
    type file
    path /var/log/fluent/access
  &lt;/store&gt;
  &lt;store&gt;
    type datacounter
    #unit hour
    count_interval 10m

    count_key code
    aggregate all
    tag nginx.datacount.web
    pattern1 2xx 2\d\d
    pattern2 3xx 3\d\d
    pattern3 4xx 4\d\d
    pattern4 5xx 5\d\d
  &lt;/store&gt;
  &lt;store&gt;
    type datacounter
    #unit hour
    count_interval 10m
    count_key response_time
    outcast_unmatched true
    aggregate all
    tag nginx.datacount.response
    pattern1 0_10ms 0\.00\d+$
    pattern2 10_100ms 0\.0[1-9]\d+$
    pattern3 100_500ms 0\.[1-4]\d+$
    pattern4 500_1000ms 0\.[5-9]\d+$
    pattern5 1_1.99s 1\.\d+$
    pattern6 2_4.99s [2-4]\.\d+$
    pattern7 5_9.99s [5-9]\.\d+$
    pattern8 10s_over \d{2,}\.\d+$
  &lt;/store&gt;
&lt;/match&gt;

#growthforecast
&lt;match nginx.datacount.**&gt;
  type growthforecast
  gfapi_url http://localhost:5000/api/
  service nginx
  tag_for section
  remove_prefix nginx.datacount
  name_key_pattern .*_(rate|count|percentage)$
&lt;/match&gt;
</pre>

リクエストタイムの割合の変化
<a href="http://tjun.jp/blog/2012/06/fluentd-dstat-growthforecast/growthforecast-request/" rel="attachment wp-att-1152"><img src="http://tjun.jp/blog/wp-content/uploads/2012/06/GrowthForecast-request.jpg" alt="" title="GrowthForecast-request" width="467" height="281" class="aligncenter size-full wp-image-1152" /></a>

これを見ると、結構時間かかってる事がわかる。

これとは別に、status code別のアクセス数の推移も見れるようになりました。
