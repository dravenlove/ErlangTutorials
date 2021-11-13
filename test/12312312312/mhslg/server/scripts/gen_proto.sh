#!/bin/bash

#########################################################################
# File Name: gen_proto.sh
# Created on: 2019-05-13 21:43:23
# Author: glendy ganby@163.com
# Last Modified: 2019-05-13 21:44:44
# Description: 
#########################################################################

ROOT=`cd $(dirname $0); pwd`
cd $ROOT

find ../proto -iname "*.proto" | while read filename
do
    protoc-gpb/bin/protoc-erl -o-erl ../src/proto -o-hrl ../include -I ../proto ${filename}
done
