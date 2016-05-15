FROM alpine:latest

MAINTAINER Ali Bengali <ali-beng-ali@users.noreply.github.com>

# Install s6 process supervisor
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# Install bash & nfs-utils
RUN apk --update upgrade && \
 apk add bash nfs-utils && \
 rm -rf /var/cache/apk/*

# Install s6 run-scripts
COPY ["rootfs","/"]

EXPOSE 111/udp 2049/tcp

ENTRYPOINT ["/init"]
