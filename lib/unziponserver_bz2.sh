#!/bin/bash
#$Id: unziponserver.sh,v 1.2 2008/05/02 08:39:41 mgr2 Exp $
bunzip2 ${zipfile}
tar -xf ${modulname}
rm ${modulname}