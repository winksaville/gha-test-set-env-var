#!/bin/sh -l

#echo "entrypoint.sh: name=$1"
#echo "entrypoint.sh: value=$2"

# TODO: when act supports $GITHUB_ENV change to
#echo "$1=$2" >> $GITHUB_ENV
echo "::set-env name=$1::$2"
