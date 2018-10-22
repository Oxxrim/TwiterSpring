#!/usr/bin/env bash

mvn clean package

echo "Copy files.."

scp -i ~/.ssh/id_rsa \
    target/TwiterSpring-1.0-SNAPSHOT.jar \
    oxxrim@