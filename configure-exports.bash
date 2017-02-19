#!/bin/bash
NFS_EXPORT_DIRS=$(compgen -A variable|grep NFS_EXPORT_DIR)
echo 'configure-exports called!'
for dir in $NFS_EXPORT_DIRS
do
 index=${dir##*_}

 net=NFS_EXPORT_DOMAIN_$index
 opt=NFS_EXPORT_OPTIONS_$index

 if [[ -n ${!dir} ]] && [[ -n ${!net} ]] && [[ -n ${!opt} ]] ; then
  echo ${!dir} ${!net}'('${!opt}')'
 fi

done>/etc/exports 

