#!/bin/bash - 
PIN_HOME=/home/jxf/pin
PARSEC_HOME=/home/wangxinalex/PTM/benchmarks/parsec/
PHOEBIX_HOME=/home/wangxinalex/PTM/benchmarks/phoenix/


version=$1

mkdir calculation.${version}
cp -f pin_opal.cpp ./calculation.${version}/pin_opal.${version}.cpp
cp -f ./calculation/calculation.c ./calculation.${version}/calculation.${version}.c
cp -f ./calculation/calculation.h ./calculation.${version}/calculation.${version}.h
cp -f ./calculation/config.h ./calculation.${version}/config.${version}.h

