#!/usr/bin/env sh

mkdir -p $HOME/.concourse
knife vault download concourse habitat $HOME/.concourse/habitat.yml
fly -t gina-main set-pipeline -p ubermap-habitat -c habitat/concourse.yml -l $HOME/.concourse/habitat.yml
rm $HOME/.concourse/habitat.yml
