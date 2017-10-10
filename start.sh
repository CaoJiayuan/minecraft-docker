#!/bin/sh

if [ "$JAVA_OPT" == "" ]; then
    JAVA_OPT="-Xms1G -Xmx2G"
fi
if [ "$VERSION" == "" ]; then
    VERSION="1.8.8"
fi

FILE=install.lock
DIR=/minecraft/${VERSION}
JAR=minecraft_server.${VERSION}.jar

cp /server.properties ${DIR}/server.properties

if [ ! -d "$DIR" ]; then
    mkdir $DIR
fi
cd $DIR
echo "eula=true" > eula.txt
if [ ! -f "$FILE" ]; then
    echo "Download version ${VERSION}"
    rm $JAR
    wget http://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/minecraft_server.${VERSION}.jar
fi

date > $FILE

java $JAVA_OPT -jar $JAR nogui