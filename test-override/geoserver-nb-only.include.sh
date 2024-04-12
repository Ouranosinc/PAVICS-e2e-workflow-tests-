#!/bin/sh
# Sample config override script to only run notebooks that hits GeoServer.

# Have to be used together with TEST_NO_USE_PROD_DATA=1.

NEW_NB_LIST=""
for nb in $NOTEBOOKS; do
    if grep -i geoserver $nb; then
        NEW_NB_LIST="$NEW_NB_LIST $nb"
    fi
done
NOTEBOOKS="$NEW_NB_LIST"
