#!/usr/bin/env bash

set -e

echo "UNTESTED"

base="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${base}/deploy_argbash.sh

version=${_arg_packerversion}
dockerfile_version=$(grep PACKER_VERSION= ${base}/Dockerfile-light | cut -d= -f2)

if [[ $version != $dockerfile_version ]]; then
    echo "Version mismatch in ${_arg_dockerfile}"
    echo "found ${dockerfile_version}, expected ${version}."
    echo "Make sure the versions are correct."
    exit 1
fi

echo "Building docker images for packer ${version}..."
# docker build -f "${base}/Dockerfile-full" -t ${_arg_uri}:full .
docker build -f "${base}/${_arg_dockerfile}" -t ${_arg_uri}:${_arg_tag} .
docker tag ${_arg_uri}:${_arg_tag} ${_arg_uri}:${version}
docker tag ${_arg_uri}:${_arg_tag} ${_arg_uri}:latest

echo "Uploading docker images for packer ${version}..."
docker push ${_arg_uri}:${version}
docker push ${_arg_uri}:latest
docker push ${_arg_uri}:${_arg_tag}
# docker push ${_arg_uri}:full
