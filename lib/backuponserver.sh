#!/bin/bash
echo 'Running TAR'
tar cjf ${server.backuppath}/$HOSTNAME/apps/${server.backupprefix}${timestamp}.tar.bz2 --exclude='${zipfile}' --exclude='*/.cvsignore' --exclude='*/.svn/*' ${backupExclude} *
echo 'Rotating Backups (${server.maxbackups} retained)'
DIR=${server.backuppath}/${HOSTNAME}/apps/
FILENAME_PREFIX='${server.backupprefix}'
MAX_FILES=${server.maxbackups}
mkdir -p ${DIR}
cd ${DIR}
COUNT_FILES=`ls ${FILENAME_PREFIX}* 2>/dev/null | wc -l`
NUMBER_TO_REMOVE=$(($COUNT_FILES - $MAX_FILES))
if [ $NUMBER_TO_REMOVE -gt 0 ] ; then
        FILES_TO_REMOVE=`ls ${FILENAME_PREFIX}* | sort | head -${NUMBER_TO_REMOVE}`
        for F in $FILES_TO_REMOVE ; do
            echo "Removing $F"
            rm $F
        done
fi