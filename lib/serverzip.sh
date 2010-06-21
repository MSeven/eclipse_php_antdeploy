#!/bin/bash
tar czf serverzip.tar.gz --exclude='serverzip.tar.gz' --exclude='*/.cvsignore' --exclude='*/.svn/*' ${backupExclude} *
