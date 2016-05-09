# docker-nfs-server

docker run --privileged \
-v /tmp:/tmp \
-e NFS_EXPORT_DIR_1=/tmp \
-e NFS_EXPORT_DOMAIN_1=192.168.80.0/24 \
-e NFS_EXPORT_OPTIONS_1=ro,insecure,no_subtree_check \
fuzzle/docker-nfs-server:v1

need to wait for nfs-utils-1.3.4 ipv6 problem!
http://www.spinics.net/lists/linux-nfs/msg55083.html
