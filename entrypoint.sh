#!/bin/sh

JAVA="/usr/bin/java"

set -e

exec ${JAVA} \
    ${JVM_OPTS} \
    -jar "/minecraft/server.jar" \
    nogui