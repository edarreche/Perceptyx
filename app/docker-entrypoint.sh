#!/bin/bash


ansible-galaxy install jdauphant.nginx
ansible-playbook playbook.yml -vv

/etc/init.d/perl-fcgi start

nginx -g "daemon off;"

#while :; do sleep 1; done
