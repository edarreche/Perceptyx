#!/bin/bash

apt-get update && apt-get install -y \
  nginx \
  libfcgi-perl \
  wget \
  vim

perl -MCPAN -e 'CPAN::Shell->install("DBI")'
perl -MCPAN -e 'CPAN::Shell->install("DBD::mysql")'

mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.old
cp nginx.conf /etc/nginx/sites-available/default
mkdir /var/www/example.com
mkdir /var/www/logs/
chown -R www-data:www-data /var/www/example.com
wget http://nginxlibrary.com/downloads/perl-fcgi/fastcgi-wrapper -O /usr/bin/fastcgi-wrapper.pl
wget http://nginxlibrary.com/downloads/perl-fcgi/perl-fcgi -O /etc/init.d/perl-fcgi
chmod +x /usr/bin/fastcgi-wrapper.pl
chmod +x /etc/init.d/perl-fcgi
usermod -s /bin/bash www-data
update-rc.d perl-fcgi defaults
insserv perl-fcgi

cp app.pl /var/www/example.com/index.pl
chmod a+x /var/www/example.com/index.pl
