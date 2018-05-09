#!/bin/bash

yyyymmdd=`date '+%F'`
foldername="${yyyymmdd}"
echo $foldername
mkdir $foldername

if [ -e $1 ]; then
  cp $1 ./$foldername/$1
else
  echo "そのファイルは存在しないよ。"
fi