#!/bin/bash
NFS_EXPORT_DIRS=$(compgen -A variable|grep NFS_EXPORT_DIR)

for dir in $NFS_EXPORT_DIRS
do
 index=${dir##*_}

 net=NFS_EXPORT_DOMAIN_$index
 opt=NFS_EXPORT_OPTIONS_$index

 if [[ -n ${!dir} ]] && [[ -n ${!net} ]] && [[ -n ${!opt} ]] ; then
  echo -e '\b'${!dir} ${!net}'('${!opt}')' >> exports
 fi

done

/sbin/rpcbind
/usr/sbin/rpc.statd --no-notify
/usr/sbin/rpc.nfsd 8
/usr/sbin/rpc.mountd -V 3 -N 2 -N 4
/usr/sbin/exportfs -ra 2>&1 > /dev/null
