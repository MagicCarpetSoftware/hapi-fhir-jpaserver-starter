FROM jetty:9-jre8-alpine
USER root:root
RUN apk add --update openssl && rm -rf /var/cache/apk/*
RUN mkdir /var/lib/jetty/etc
ADD ./target/hapi-fhir-jpaserver /var/lib/jetty/webapps/root
ADD ./server/jetty.start /var/lib/jetty/jetty.start
ADD ./server/jetty-ssl-context.xml /usr/local/jetty/etc/jetty-ssl-context.xml
ADD ./server/docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 8080
