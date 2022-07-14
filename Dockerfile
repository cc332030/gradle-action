FROM ibm-semeru-runtimes:open-11-jdk

RUN apt update && apt install -y \
    openssh-client gnupg gnupg2 \
    curl

ENV C_GITHUB_URL=https://github.com/cc332030

ADD *.sh /

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
