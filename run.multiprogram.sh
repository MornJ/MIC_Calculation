#!/bin/bash
dir1=/home/minqh/work/combine/pin/pin/
dir2=/home/minqh/work/combine/pin/pin/source/tools/pin_opal/result/
dir3=/home/minqh/work/combine/pin/pin/source/tools/pin_opal/multiprogram
dir4=/home/minqh/work/combine/pin/pin/source/tools/pin_opal/
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so -- ./FFT -m16 -p1) >& $dir2/fft.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
#dir3=/home/minqh/work/combine/img/splash2/source/codes/kernels/lu/contiguous_blocks
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./LU -p1) >& $dir2/lu_C.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
#dir3=/home/minqh/work/combine/img/splash2/source/codes/kernels/lu/non_contiguous_blocks
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./LU -n 1024 -p1) >& $dir2/lu_N.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
#dir3=/home/minqh/work/combine/img/splash2/source/codes/kernels/radix
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./RADIX -n4194304 -r1024 -m524288 -p1) >& $dir2/radix.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
#dir3=/home/minqh/work/combine/img/splash2/source/codes/kernels/cholesky
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./CHOLESKY -p1 inputs/tk29.O) >& $dir2/cholesky.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
#dir3=/home/minqh/work/combine/img/splash2/source/codes/apps/water-nsquared
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./WATER-NSQUARED < input1 ) >& $dir2/water_N.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
#dir3=/home/minqh/work/combine/img/splash2/source/codes/apps/water-spatial
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./WATER-SPATIAL < input1) >& $dir2/water_S.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
#dir3=/home/minqh/work/combine/img/splash2/source/codes/apps/ocean/contiguous_partitions
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./OCEAN -p1) >& $dir2/ocean_C.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
#dir3=/home/minqh/work/combine/img/splash2/source/codes/apps/ocean/non_contiguous_partitions
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./OCEAN -p1) >& $dir2/ocean_N.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
#dir3=/home/minqh/work/combine/img/splash2/source/codes/apps/barnes
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./BARNES NPROC < input1) >& $dir2/barnes.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
#dir3=/home/minqh/work/combine/img/parsec/pkgs/apps/blackscholes/inst/amd64-linux.gcc-pthreads/bin
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./blackscholes 1 ../../../inputs/in_4K.txt prices.txt) >& $dir2/blackscholes.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
#dir3=/home/minqh/work/combine/img/parsec/pkgs/apps/bodytrack/inst/amd64-linux.gcc-pthreads/bin
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./bodytrack ../../../inputs/sequenceB_1 4 1 5 1 0 1) >& $dir2/bodytrack.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
#dir3=/home/minqh/work/combine/img/parsec/pkgs/apps/ferret/inst/amd64-linux.gcc-pthreads/bin
#cd $dir3
#(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./ferret ../../../inputs/corel lsh ../../../inputs/queries 1 1 4 output.txt) >& $dir2/ferret.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
#
cd $dir3
(time -p $dir1/pin -t ${dir4}obj-intel64/pin_opal.so  -- ./multiprogram) >& $dir2/multiprogram.trace
#cat inscount.out >> $dir2/fft.trace
#rm inscount.out
