#!/bin/sh

set -e

pwd
ls -la
hab -V

cd $APPLICATION_PATH

hab pkg build .
