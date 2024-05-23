#!/bin/bash

/usr/sbin/nginx &
/usr/sbin/php-fpm -F
tail -f /dev/null
