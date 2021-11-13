#!/bin/bash

#########################################################################
# File Name: clean.sh
# Created on: 2019-05-09 17:26:50
# Author: glendy ganby@163.com
# Last Modified: 2019-05-09 17:27:53
# Description: 
#########################################################################

MY_PATH=$(cd `dirname $0`; pwd)
cd "$MY_PATH"

/bin/rm *.dump
/bin/rm ebin/*.beam
