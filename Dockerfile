FROM registry.docker-cn.com/library/openjdk:8u131-jre-alpine

MAINTAINER 'Cao Jiayuan'

WORKDIR /minecraft

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk --update add \
    wget

COPY start.sh /start.sh
COPY server.properties /server.properties

RUN chmod +x /start.sh

VOLUME ["/minecraft"]
EXPOSE 25565

ENTRYPOINT /start.sh
