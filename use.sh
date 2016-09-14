#!/bin/bash - 

version=$1

cd calculation.${version}
cp pin_opal.${version}.cpp ../pin_opal.cpp
cp calculation.${version}.c ../calculation/calculation.c
cp calculation.${version}.h ../calculation/calculation.h
