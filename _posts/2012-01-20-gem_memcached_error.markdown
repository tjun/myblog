---
layout: post
status: publish
published: true
title: gem install memcached ではまったメモ
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1085
wordpress_url: http://tjun.jp/blog/?p=1085
date: 2012-01-20 23:22:07.000000000 +09:00
categories:
- linux
- ruby
tags:
- ruby
- memcached
comments: []
---
Error:
<pre>
$gem install memcached
...
rlibmemcached_wrap.c: In function &lsquo;_wrap_MemcachedSt_sasl_callbacks_set&rsquo;:
rlibmemcached_wrap.c:6669: error: &lsquo;sasl_callback_t&rsquo; undeclared (first use in this function)
rlibmemcached_wrap.c:6669: error: (Each undeclared identifier is reported only once
rlibmemcached_wrap.c:6669: error: for each function it appears in.)
rlibmemcached_wrap.c:6669: error: &lsquo;arg2&rsquo; undeclared (first use in this function)
rlibmemcached_wrap.c:6669: error: expected expression before &lsquo;)&rsquo; token
rlibmemcached_wrap.c:6687: error: expected expression before &lsquo;)&rsquo; token
rlibmemcached_wrap.c:6688: error: &lsquo;struct memcached_st&rsquo; has no member named &lsquo;sasl_callbacks&rsquo;
rlibmemcached_wrap.c:6688: error: expected &lsquo;)&rsquo; before &lsquo;const&rsquo;
rlibmemcached_wrap.c:6688: error: expected &lsquo;;&rsquo; before &lsquo;arg2&rsquo;
rlibmemcached_wrap.c: In function &lsquo;_wrap_MemcachedSt_sasl_callbacks_get&rsquo;:
rlibmemcached_wrap.c:6700: error: &lsquo;sasl_callback_t&rsquo; undeclared (first use in this function)
rlibmemcached_wrap.c:6700: error: &lsquo;result&rsquo; undeclared (first use in this function)
rlibmemcached_wrap.c:6711: error: expected expression before &lsquo;)&rsquo; token
rlibmemcached_wrap.c:6711: error: &lsquo;struct memcached_st&rsquo; has no member named &lsquo;sasl_callbacks&rsquo;
rlibmemcached_wrap.c: In function &lsquo;_wrap_memcached_set_sasl_callbacks&rsquo;:
rlibmemcached_wrap.c:12021: error: &lsquo;sasl_callback_t&rsquo; undeclared (first use in this function)
rlibmemcached_wrap.c:12021: error: &lsquo;arg2&rsquo; undeclared (first use in this function)
rlibmemcached_wrap.c:12021: error: expected expression before &lsquo;)&rsquo; token
rlibmemcached_wrap.c:12039: error: expected expression before &lsquo;)&rsquo; token
rlibmemcached_wrap.c:12040: error: expected &lsquo;)&rsquo; before &lsquo;const&rsquo;
rlibmemcached_wrap.c:12040: error: expected &lsquo;)&rsquo; before &lsquo;arg2&rsquo;
rlibmemcached_wrap.c: In function &lsquo;_wrap_memcached_get_sasl_callbacks&rsquo;:
rlibmemcached_wrap.c:12122: error: &lsquo;sasl_callback_t&rsquo; undeclared (first use in this function)
rlibmemcached_wrap.c:12122: error: &lsquo;result&rsquo; undeclared (first use in this function)
rlibmemcached_wrap.c:12133: error: expected expression before &lsquo;)&rsquo; token
rlibmemcached_wrap.c: In function &lsquo;Init_rlibmemcached&rsquo;:
rlibmemcached_wrap.c:13285: error: &lsquo;SASL_OK&rsquo; undeclared (first use in this function)
make: *** [rlibmemcached_wrap.o] Error 1
</pre>

<pre>
$ gem clean memcached
</pre>

centos
<pre>
$ yum install cyrus-sasl2 cyrus-sasl-devel
</pre>

ubuntu, debian
<pre>
$ apt-get install libsasl2-2 libsasl2-dev
</pre>
