#!/bin/bash
echo "execute processing"
id=$1
filepath=$2
filenameext=$3
filename=${filenameext%.*}

echo $filepath

mkdir /tmp/$filename
cp -rf $filepath /tmp/$filename/$filenameext
/usr/local/bin/processing-java --sketch=/tmp/$filename --output=/tmp/test_sketch  --force --run
