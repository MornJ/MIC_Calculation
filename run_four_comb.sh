#!/bin/bash - 
#===============================================================================
#
#          FILE: run_four_comb.sh
# 
#         USAGE: ./run_four_comb.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: wangxinalex (), wangxinalex@gmail.com
#  ORGANIZATION: 
#       CREATED: 04/17/15 22:18
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

PIN_HOME=~/PTM/pin
BENCHMARK_HOME=~/PTM/benchmarks

$PIN_HOME/pin -t obj-intel64/pin_opal.so -- $BENCHMARK_HOME/spec2006/run_four_comb.sh
