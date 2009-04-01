#!/bin/bash
#$Id: backuponserver.sh,v 1.4 2007/01/30 12:07:17 mgr2 Exp $
tar czf serverzip.tar.gz --exclude='serverzip.tar.gz' --exclude='*/.cvsignore' --exclude='*/.svn/*' ${backupExclude} *
