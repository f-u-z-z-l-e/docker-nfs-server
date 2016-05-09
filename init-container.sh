#!/bin/bash
for i in {1..10}
do
 dir=NFS_EXPORT_DIR_$i
 net=NFS_EXPORT_DOMAIN_$i
 opt=NFS_EXPORT_OPTIONS_$i

 if [[ -n ${!dir} ]] && [[ -n ${!net} ]] && [[ -n ${!opt} ]] ; then
  echo -e '\b'${!dir} ${!net}'('${!opt}')' >> /etc/exports
 fi
done

/sbin/rpcbind
/usr/sbin/rpc.statd --no-notify
/usr/sbin/rpc.nfsd 8
/usr/sbin/rpc.mountd -V 3 -N 2 -N 4
/usr/sbin/exportfs -ra 2>&1 > /dev/null
