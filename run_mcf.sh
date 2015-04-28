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
BENCHMARK_HOME=~/PTM/benchmarks/spec2006

$PIN_HOME/pin -t obj-intel64/pin_opal.so -- $BENCHMARK_HOME/mcf $BENCHMARK_HOME/inp.in > mcf.out
$PIN_HOME/pin -t obj-intel64/pin_opal.so -- $BENCHMARK_HOME/cactusADM $BENCHMARK_HOME/benchADM.par > cactusADM.out
$PIN_HOME/pin -t obj-intel64/pin_opal.so -- $BENCHMARK_HOME/xalancbmk -v $BENCHMARK_HOME/t5.xml $BENCHMARK_HOME/xalanc.xsl > xalanc.out
$PIN_HOME/pin -t obj-intel64/pin_opal.so -- $BENCHMARK_HOME/lbm 3000 $BENCHMARK_HOME/lbm.in 0 0 $BENCHMARK_HOME/100_100_130_ldc.of > lbm.out
