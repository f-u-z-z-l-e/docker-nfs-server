FROM alpine:latest

RUN apk --update upgrade && \
 apk add bash nfs-utils && \
 rm -rf /var/cache/apk/*

COPY ["init-container.sh","/init-container.sh"]
RUN ["chmod","755","/init-container.sh"]

EXPOSE 111/udp 2049/tcp

ENTRYPOINT ["/bin/bash","init-container.sh"]

