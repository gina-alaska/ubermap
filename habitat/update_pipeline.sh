#!/usr/bin/env sh
fly -t gina-main set-pipeline -p ubermap-habitat -c habitat/concourse.yml -l ~/.concourse/habitat.yml
