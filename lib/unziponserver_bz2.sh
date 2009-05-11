#!/bin/bash
#$Id: unziponserver.sh,v 1.2 2008/05/02 08:39:41 mgr2 Exp $
echo "Extracting ${zipfile}"
tar -xjf ${zipfile}
echo "Removing ${zipfile}"
rm ${zipfile}