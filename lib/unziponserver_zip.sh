#!/bin/bash
echo "Unzipping ${zipfile}"
unzip -oq ${zipfile}
echo "Removing ${zipfile}"
rm -f ${zipfile}