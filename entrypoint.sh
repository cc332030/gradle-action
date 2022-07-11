#!/bin/sh

set -e

parameter=$*

curl_sh(){
  sh -c "curl -sL https://github.com/cc332030$1 | sh -s -- $parameter"
}

curl_sh /linux/raw/master/script/init-ssh/init-ssh-pre.sh
curl_sh /linux/raw/master/script/init-ssh/init-ssh.sh

if [ "$GPG_PRIVATE_KEY" ]; then
  curl_sh /linux/raw/master/script/init-gpg/init-gpg.sh
fi

curl_sh /gradle/raw/master/script/init-gradle/init-gradle.sh

if [ -n "$COMMAND" ]
then
  ${COMMAND} || true
fi
