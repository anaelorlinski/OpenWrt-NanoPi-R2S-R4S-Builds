#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR

SCRIPTDIR=$(dirname $(readlink -f $0))
echo $SCRIPTDIR