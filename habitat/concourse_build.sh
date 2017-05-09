#!/bin/sh

set -e

pwd
ls -la
hab -V

mkdir -p /hab/cache/keys
echo -n "${HABITAT_ORIGIN_CONTENT}" > "/hab/cache/keys/${HABITAT_ORIGIN_FILENAME}"
echo -n "${HABITAT_PUB_CONTENT}" > "/hab/cache/keys/${HABITAT_PUB_FILENAME}"

ls -la /hab/cache/keys
cat "/hab/cache/keys/${HABITAT_ORIGIN_FILENAME}"

cd "${APPLICATION_PATH}"

hab pkg build . -k $HABITAT_ORIGIN_KEY
