FROM perl:5.20
RUN  mkdir -p /usr/src/app
COPY app.pl /usr/src/myapp/
WORKDIR /usr/src/myapp
RUN perl -MCPAN -e 'CPAN::Shell->install("DBI")'
RUN perl -MCPAN -e 'CPAN::Shell->install("DBD::mysql")'
CMD [ "perl", "./app.pl" ]
