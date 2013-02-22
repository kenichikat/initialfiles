#!/bin/sh

cd $(dirname $0)
test -d backup || mkdir backup
for f in `ls -a|egrep -v '.git|backup|README.md|mkslink.sh|\.$'`
do
    test -f ${HOME}/$f && mv ${HOME}/$f backup/$f.`date +%Y%m%d%H%M` 
    test -L ${HOME}/$f && mv ${HOME}/$f backup/$f.`date +%Y%m%d%H%M` 

    ln -s `pwd`/$f ${HOME}/$f
done

