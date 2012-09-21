--- 
layout: post
title: "gem install memcached \xE3\x81\xA7\xE3\x81\xAF\xE3\x81\xBE\xE3\x81\xA3\xE3\x81\x9F\xE3\x83\xA1\xE3\x83\xA2"
wordpress_id: 1085
wordpress_url: http://tjun.jp/blog/?p=1085
date: 2012-01-20 23:22:07 +09:00
---
Error:
<pre>
$gem install memcached
...
rlibmemcached_wrap.c: In function ‘_wrap_MemcachedSt_sasl_callbacks_set’:
rlibmemcached_wrap.c:6669: error: ‘sasl_callback_t’ undeclared (first use in this function)
rlibmemcached_wrap.c:6669: error: (Each undeclared identifier is reported only once
rlibmemcached_wrap.c:6669: error: for each function it appears in.)
rlibmemcached_wrap.c:6669: error: ‘arg2’ undeclared (first use in this function)
rlibmemcached_wrap.c:6669: error: expected expression before ‘)’ token
rlibmemcached_wrap.c:6687: error: expected expression before ‘)’ token
rlibmemcached_wrap.c:6688: error: ‘struct memcached_st’ has no member named ‘sasl_callbacks’
rlibmemcached_wrap.c:6688: error: expected ‘)’ before ‘const’
rlibmemcached_wrap.c:6688: error: expected ‘;’ before ‘arg2’
rlibmemcached_wrap.c: In function ‘_wrap_MemcachedSt_sasl_callbacks_get’:
rlibmemcached_wrap.c:6700: error: ‘sasl_callback_t’ undeclared (first use in this function)
rlibmemcached_wrap.c:6700: error: ‘result’ undeclared (first use in this function)
rlibmemcached_wrap.c:6711: error: expected expression before ‘)’ token
rlibmemcached_wrap.c:6711: error: ‘struct memcached_st’ has no member named ‘sasl_callbacks’
rlibmemcached_wrap.c: In function ‘_wrap_memcached_set_sasl_callbacks’:
rlibmemcached_wrap.c:12021: error: ‘sasl_callback_t’ undeclared (first use in this function)
rlibmemcached_wrap.c:12021: error: ‘arg2’ undeclared (first use in this function)
rlibmemcached_wrap.c:12021: error: expected expression before ‘)’ token
rlibmemcached_wrap.c:12039: error: expected expression before ‘)’ token
rlibmemcached_wrap.c:12040: error: expected ‘)’ before ‘const’
rlibmemcached_wrap.c:12040: error: expected ‘)’ before ‘arg2’
rlibmemcached_wrap.c: In function ‘_wrap_memcached_get_sasl_callbacks’:
rlibmemcached_wrap.c:12122: error: ‘sasl_callback_t’ undeclared (first use in this function)
rlibmemcached_wrap.c:12122: error: ‘result’ undeclared (first use in this function)
rlibmemcached_wrap.c:12133: error: expected expression before ‘)’ token
rlibmemcached_wrap.c: In function ‘Init_rlibmemcached’:
rlibmemcached_wrap.c:13285: error: ‘SASL_OK’ undeclared (first use in this function)
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
