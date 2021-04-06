#/!bin/bash

name=brainlife/ui-mne
version=0.22.1

set -e
docker build -t $name .
docker tag $name $name:$version
docker push $name
