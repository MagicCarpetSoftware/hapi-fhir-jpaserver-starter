FROM jetty:9-jre8-alpine
USER jetty:jetty
ADD ./target/hapi-fhir-jpaserver /var/lib/jetty/webapps/root
EXPOSE 8080
