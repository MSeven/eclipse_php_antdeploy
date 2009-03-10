#!/bin/bash
#$Id: backuponserver.sh,v 1.4 2007/01/30 12:07:17 mgr2 Exp $
echo 'Running TAR'
tar czf ${server.backuppath}/$HOSTNAME/apps/${server.backupprefix}${timestamp}.tar.gz --exclude='${zipfile}' --exclude='*/.cvsignore' --exclude='*/.svn/*' ${backupExclude} *
echo 'Rotating Backups (${server.maxbackups} retained)'
DIR=${server.backuppath}/${HOSTNAME}/apps/
FILENAME_PREFIX='${server.backupprefix}'
MAX_FILES=${server.maxbackups}
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