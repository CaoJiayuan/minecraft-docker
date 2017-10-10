#!/bin/sh
echo "eula=true" > eula.txt
if [ "$JAVA_OPT" == "" ]; then
    JAVA_OPT="-Xms1G -Xmx2G"
fi
if [ "$VERSION" == "" ]; then
    VERSION="1.8.8"
fi
cp /server.properties /minecraft/server.properties

FILE=version_${VERSION}.lock
JAR=/minecraft/minecraft_server.${VERSION}.jar

if [ ! -f "$FILE" ]; then
    echo "Download version ${VERSION}"
    rm $JAR
    wget http://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/minecraft_server.${VERSION}.jar
fi

echo date > $FILE

java $JAVA_OPT -jar $JAR nogui