#!/bin/bash
#$Id: unziponserver.sh,v 1.3 2007/01/12 11:58:25 mgr2 Exp $
echo "Unzipping ${zipfile}"
unzip -oq ${zipfile}
echo "Deleting ${zipfile}"
rm -f ${zipfile}