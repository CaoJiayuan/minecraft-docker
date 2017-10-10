FROM registry.docker-cn.com/library/openjdk:8u131-jre-alpine

WORKDIR /minecraft
#ARG JAVA_OPT="-Xms1G -Xmx2G"
#ARG VERSION=1.8.8

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk --update add \
    wget \
    git

COPY start.sh /start.sh
RUN chmod +x /start.sh
COPY server.properties /server.properties

#ENV JAVA_OPT=${JAVA_OPT} \
#    VERSION=${VERSION}

#RUN wget http://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/minecraft_server.${VERSION}.jar

VOLUME ["/minecraft"]
EXPOSE 25565

ENTRYPOINT /start.sh
