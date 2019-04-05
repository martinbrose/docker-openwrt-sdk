#!/usr/bin/env bash
# Use ./build.sh your_Dockerfile your_tag
if [ $# -eq 0 ]
  then
    tag='latest'
  else
    tag=$2
fi

docker build -t openwrt-sdk:$tag -f $1 ./
