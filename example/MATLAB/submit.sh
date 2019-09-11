#!/bin/bash

sed "s/--job-name=Matlab/--job-name=Matlab-$1/g" test.sbatch > run-$1.sbatch
sed -i "s/user_defined_function/$1/g" run-$1.sbatch
sbatch run-$1.sbatch

