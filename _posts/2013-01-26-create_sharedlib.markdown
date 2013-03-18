---
layout: post
category:
title: Shared Libraryについて
date: 2013-01-26
description:
keywords:
---

CやC++でShared Libraryを作るときのメモです。
外に出したいシンボルと、外に出したくないシンボルがあるとき、どのようにしたらよいのか知らなかったので。
常識かもしれないけど、CとC++が両方ある場合にどうすればいいのか、調べてもあんまり情報が出て来なかった。

以下のようなサンプルがあるとします。

#### hoge.h
{% highlight c linenos %}

#ifndef HOGE_H
#define HOGE

#ifdef __cplusplus
extern "C" {
#endif

void hoge();

#ifdef __cplusplus
}
#endif

#endif

{% endhighlight %}

#### hoge.c
{% highlight c linenos %}
#include "hoge.h"

void hoge_local() {
}

void hoge() {
  hoge_local();
}
{% endhighlight %}

#### fuga.h

{% highlight c linenos %}
class Fuga {
public:
  Fuga();
  ~Fuga();
private:
  int fugafuga();
};
{% endhighlight %}


#### fuga.cpp

{% highlight c linenos %}

#include "hoge.h"
#include "fuga.h"

Fuga::Fuga() {

}
Fuga::~Fuga() {
}

int Fuga::fugafuga()
{
  hoge();
  return 0;
}

{% endhighlight %}


このようにCとC++が混ざってる状況で、例えば、hoge_localは、内部でしか使わないのでライブラリにしたときに利用して欲しくない、という時があると思います。



コンパイル時にはfPICをつけます。
<pre>
$ gcc -fPIC -c -o hoge.o hoge.c
$ g++ -fPIC -c -o fuga.o fuga.cpp
</pre>

試しにそのままshared libraryを作って
<pre>
g++ -shared -fPIC -o libhogefuga.so fuga.o hoge.o
</pre>

これでシンボルをみてみると
<pre>
$ nm -g -C -D libhogefuga2.so ~/dev/tmp2

w _Jv_RegisterClasses
00000000000006d0 T Fuga::fugafuga()
00000000000006bc T Fuga::Fuga()
00000000000006bc T Fuga::Fuga()
00000000000006c6 T Fuga::~Fuga()
00000000000006c6 T Fuga::~Fuga()
0000000000201020 A __bss_start
w __cxa_finalize
w __gmon_start__
0000000000201020 A _edata
0000000000201030 A _end
0000000000000738 T _fini
0000000000000598 T _init
00000000000006ee T hoge
00000000000006e8 T hoge_local
</pre>

こんな感じでhoge_localもシンボルが残って外から見えてしまいます。


この状況で、hoge_localとfugafugaは隠したい。
そのようなときには、version-script というものを利用します。

先ほどの例で、hoge_localとFuga::fugafuga以外をexportしたいので、以下のように書くことができます。

#### hogefuga.vermap
<pre>
{
  global:
    extern "C++" {      
      Fuga::Fuga*;
      Fuga::?Fuga*;
    };
    hoge;
  local:
      *;
};
</pre>
globalの部分に公開するシンボルを記述して、localは*で残り全部、としてます。
C++ のマングルされたシンボルに対応するため、C++でexportしたいシンボルは
extern "C++" {} で囲ってます。

上の例のようにワイルドカードが使えますが、チルダは使えないので、デストラクタのexportでは、"?"で何か１文字、ということを表して代用してます。

このversion-scriptを以下のようなオプションでリンカのオプションに渡して、shared libraryを作ります。
<pre>
g++ -shared -fPIC -o libhogefuga2.so fuga.o hoge.o -Wl,--version-script=hogefuga.vermap
</pre>

先ほどと同様にシンボルを見ると、
<pre>
$ nm -g -C -D libhogefuga2.so ~/dev/tmp2

w _Jv_RegisterClasses
000000000000057c T Fuga::Fuga()
000000000000057c T Fuga::Fuga()
0000000000000586 T Fuga::~Fuga()
0000000000000586 T Fuga::~Fuga()
w __cxa_finalize
w __gmon_start__
00000000000005ae T hoge
</pre>

とversion-scriptでglobalに書いた部分だけ残っていて、目的が達成されました。

### 参考にしたサイト

<a href="http://accu.org/index.php/journals/1372">ACCU :: Working with GNU Export Maps</a>




