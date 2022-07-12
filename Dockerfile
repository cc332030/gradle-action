FROM adoptopenjdk/openjdk11

RUN apt update && \
    apt install -y \
      openssh-client gnupg gnupg2 \
      curl

ADD *.sh /

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
