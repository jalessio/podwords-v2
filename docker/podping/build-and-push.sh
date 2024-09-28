#!/bin/bash

# I am reusing a BuildKit server that Kamal set up previously. If it doesn't work as expected
# you may need to tell docker to use the remote builder like this:
#
# docker buildx use kamal-podwords-native-remote
#
# Once that is in place you can run this script.

docker buildx \
  build -t ghcr.io/jalessio/podwords:podping-latest \
  --push \
  .
