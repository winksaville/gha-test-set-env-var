#!/bin/sh -l

echo first-param=$1

# TODO: when act supports $GITHUB_ENV change to
#echo "name1=value1" >> $GITHUB_ENV
echo "::set-env name=name1::value1"
