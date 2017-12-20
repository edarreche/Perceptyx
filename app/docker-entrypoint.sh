#!/bin/bash

#install playbook
ansible-galaxy install jdauphant.nginx

# Run playbook to configure instance
ansible-playbook playbook.yml -vv

#start fastcgi
/etc/init.d/perl-fcgi start

#start Nginx
nginx -g "daemon off;"
