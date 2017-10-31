FROM openjdk:8u131-jre-alpine

MAINTAINER 'Cao Jiayuan'

WORKDIR /minecraft

RUN apk --update add \
    wget gettext

COPY start.sh /start.sh
COPY server.properties.template /server.properties.template

RUN chmod +x /start.sh

VOLUME ["/minecraft"]
EXPOSE 25565

ENTRYPOINT /start.sh
