FROM daocloud.io/library/java:8u111-jre-alpine

WORKDIR /minecraft

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk --update add \
    wget \
    git

COPY start.sh /minecraft/start.sh
RUN chmod +x /minecraft/start.sh
COPY server.properties /minecraft/server.properties

VOLUME ["/minecraft"]

ENTRYPOINT /minecraft/start.sh
