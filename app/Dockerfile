FROM perl:5.20
RUN  mkdir -p /app
COPY . /app/
WORKDIR /app
RUN chmod u+x /app/inst_ws.sh
RUN /app/inst_ws.sh
EXPOSE 80
COPY ./docker-entrypoint.sh /
RUN chmod u+x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
