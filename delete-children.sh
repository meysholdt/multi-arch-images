#! /bin/bash

children=$(docker manifest inspect \
           ghcr.io/meysholdt/multi-arch-images:main |
           jq -r '.manifests[].digest')

for d in $children; do
    docker image rm --force $d
done