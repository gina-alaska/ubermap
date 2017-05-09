#!/bin/sh

set -e

pwd
ls -la
hab -V

mkdir -p /hab/cache/keys
echo "${HABITAT_ORIGIN_CONTENT}" > "/hab/cache/keys/${HABITAT_ORIGIN_FILENAME}"

ls -la /hab/cache/keys

cd "${APPLICATION_PATH}"

hab pkg build .
