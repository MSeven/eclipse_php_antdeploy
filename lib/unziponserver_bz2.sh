#!/bin/bash
echo "Extracting ${zipfile}"
tar -xjf ${zipfile}
echo "Removing ${zipfile}"
rm ${zipfile}