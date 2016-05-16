FROM alpine:latest

MAINTAINER Ali Bengali <ali-beng-ali@users.noreply.github.com>

# Install bash & nfs-utils
RUN apk --update upgrade && \
 apk add bash nfs-utils && \
 rm -rf /var/cache/apk/*

COPY ["/configure-exports.bash","/"]
COPY ["/start-container.bash","/"]
RUN ["chmod","755","/configure-exports.bash"]
RUN ["chmod","755","/start-container.bash"]

EXPOSE 111/udp 2049/udp 2049/tcp

ENTRYPOINT ["/start-container.bash"]
