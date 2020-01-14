#!/usr/bin/env sh

# Install Node.js for Armv6
f=$(curl -sL https://nodejs.org/download/release/latest-dubnium/ | grep "armv6l.tar.gz" | cut -d '"' -f 2)
curl -sL -o node.tgz https://nodejs.org/download/release/latest-dubnium/$f 
# unpack it into the correct places
hd=$(head -c 9 node.tgz)
if [ "$hd" == "<!DOCTYPE" ]; then
  echo "File $f not downloaded";
  exit 1
else
    tar -zxf node.tgz --strip-components=1 -C /usr
fi
# remove the tgz file to save space
rm node.tgz
