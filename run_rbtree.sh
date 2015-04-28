#!/bin/bash - 
#===============================================================================
#
#          FILE: run_btree.sh
# 
#         USAGE: ./run_btree.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: wangxinalex (), wangxinalex@gmail.com
#  ORGANIZATION: 
#       CREATED: 04/14/15 20:47
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
PIN_HOME=~/PTM/pin
BENCHMARK_HOME=~/PTM/benchmarks

if [ $# != 2 ]; then
    echo "./run_rbtree.sh <MBs> <cores>"
    exit 1
fi
$PIN_HOME/pin -t obj-intel64/pin_opal.so -- $BENCHMARK_HOME/rbtree/rbtree $1 $2

