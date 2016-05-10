# docker-nfs-server

## to start
    docker run --privileged \
    -v /tmp:/tmp \
    -e NFS_EXPORT_DIR_1=/tmp \
    -e NFS_EXPORT_DOMAIN_1=192.168.1.0/24 \
    -e NFS_EXPORT_OPTIONS_1=ro,insecure,no_subtree_check \
    fuzzle/docker-nfs-server:v1

## volumes
You will need to provide the container with the volume(s) that you want to expose via nfs
    
    -v <local path>:<path in container>

## environment variables
You will need to provide at the following 3 environment variables to configure the nfs exports:
* NFS_EXPORT_DIR_1
* NFS_EXPORT_DOMAIN_1
* NFS_EXPORT_OPTIONS_1

When the container is started, the **init-container.sh** script parses the environment variables and creates the following output in **/etc/exports** file:

    NFS_EXPORT_DIR_1 NFS_EXPORT_DOMAIN_1(NFS_EXPORT_OPTIONS_1)
for the example given the following line in **/etc/exports** would be created:

    /tmp 192.168.1.0/24(ro,insecure,no_subtree_check)

To define multiple exports, just increment the index on the environment variables

## Todo
* There seems to be a bug on systems with ipv6 disabled kernels/configs:
[have a look at the mailing list](http://www.spinics.net/lists/linux-nfs/msg53046.html)
 * should be fixed with nfs-utils-1.3.4
* eliminate --privileged mode, have a look ...
 * [here](http://linux.die.net/man/7/capabilities)
 * and [here](https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities)
