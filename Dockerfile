FROM adoptopenjdk/openjdk11

RUN apt update && \
    apt install -y \
      curl \
      git openssh-client

ADD *.sh /

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
