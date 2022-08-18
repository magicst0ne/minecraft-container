# Use alpine as base image
FROM --platform=${BUILDPLATFORM} alpine:latest
LABEL maintainer="Stone <github.com/magicst0ne>"

ARG JVM_OPTS='-server -Xmx2g -Xms1g'

# Install dependencies
RUN apk --update add --no-cache; \
    apk add bash openjdk17 ca-certificates jq; \
    mkdir /minecraft

# Define working directory
WORKDIR /minecraft

RUN echo "eula=true" > /minecraft/eula.txt
ADD server.jar /minecraft/server.jar
ADD Server.properties /minecraft/Server.properties
ADD entrypoint.sh /entrypoint.sh


EXPOSE 25565/tcp

RUN chmod +x /entrypoint.sh
CMD ["sh", "/entrypoint.sh"]
