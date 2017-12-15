#!/bin/bash

echo "Starting NGINX"
/etc/init.d/nginx start
echo "Started NGINX"
echo "Starting FCGI"
/etc/init.d/perl-fcgi start
echo "Started FCGI"
 while :; do sleep 1; done
