#!/bin/bash - 

version=$1
create_version=$2

mkdir calculation.${create_version}
cp pin_opal.cpp ./calculation.${create_version}/pin_opal.${create_version}.cpp
cp ./calculation/calculation.c ./calculation.${create_version}/calculation.${create_version}.c
cp ./calculation/calculation.h ./calculation.${create_version}/calculation.${create_version}.h

cd calculation.${version}
cp pin_opal.${version}.cpp ../pin_opal.cpp
cp calculation.${version}.c ../calculation/calculation.c
cp calculation.${version}.h ../calculation/calculation.h

