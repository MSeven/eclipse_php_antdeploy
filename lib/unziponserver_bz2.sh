#!/bin/bash
#$Id: unziponserver.sh,v 1.2 2008/05/02 08:39:41 mgr2 Exp $
echo "Decompressing ${zipfile}"
bunzip2 ${zipfile}
echo "Extracting ${zipfile}"
tar -xf ${modulname}
echo "Removing ${zipfile}"
rm ${modulname}