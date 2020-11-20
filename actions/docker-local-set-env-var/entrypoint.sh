#!/bin/sh -l

#echo "entrypoint.sh: name=$1"
#echo "entrypoint.sh: value=$2"

if [ "$1" == "" ]; then
	echo "env-name is missing"
	exit 1
fi

# TODO: when act supports $GITHUB_ENV change to
#echo "$1=$2" >> $GITHUB_ENV
echo "::set-env name=$1::$2"
