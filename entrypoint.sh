#!/bin/sh

set -e

parameter=$*

curl_sh(){
  sh -c "curl -sL https://github.com/cc332030$1 | sh -s -- $parameter"
}

if [ "$GPG_PRIVATE_KEY" ]; then
  curl_sh /linux/raw/master/script/init-gpg/init-gpg.sh
fi

curl_sh /gradle/raw/master/script/init-gradle/init-gradle.sh

$1

if [ "$HOST" ] && [ "$PORT" ]; then
  curl_sh /linux/raw/master/script/deploy/deploy.sh
fi
