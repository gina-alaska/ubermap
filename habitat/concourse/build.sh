#!/bin/sh

set -e

echo "*** DEBUG INFO ***"
pwd
hab -V

echo "*** Create hab keys ***"
mkdir -p /hab/cache/keys
echo -n "${HABITAT_ORIGIN_CONTENT}" > "/hab/cache/keys/${HABITAT_ORIGIN_FILENAME}"
echo -n "${HABITAT_PUB_CONTENT}" > "/hab/cache/keys/${HABITAT_PUB_FILENAME}"

echo "*** Build package ***"
cd "${APPLICATION_PATH}"
hab pkg build . -k $HABITAT_ORIGIN_KEY
