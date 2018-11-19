#!/usr/bin/env bash

set -e

base="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ $# -ne 1 ]]; then
    echo "You must set a version number"
    echo "./deploy.sh <packer version>"
    exit 1
fi

version=$1
dockerfile_version=$(grep PACKER_VERSION= ${base}/Dockerfile-light | cut -d= -f2)

if [[ $version != $dockerfile_version ]]; then
    echo "Version mismatch in 'Dockerfile-light'"
    echo "found ${dockerfile_version}, expected ${version}."
    echo "Make sure the versions are correct."
    exit 1
fi

echo "Building docker images for packer ${version}..."
# docker build -f "${base}/Dockerfile-full" -t bmckinley/packeransible:full .
docker build -f "${base}/Dockerfile-light" -t bmckinley/packeransible:light .
docker tag bmckinley/packeransible:light bmckinley/packeransible:${version}
docker tag bmckinley/packeransible:light bmckinley/packeransible:latest

echo "Uploading docker images for packer ${version}..."
docker push bmckinley/packeransible:${version}
docker push bmckinley/packeransible:latest
docker push bmckinley/packeransible:light
docker push bmckinley/packeransible:full
