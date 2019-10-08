#!/bin/bash

sed "s/--job-name=Julia/--job-name=Julia-$1/g" template.s > run-$1.s
sed -i "s/user_defined_function/$1/g" run-$1.s
sbatch run-$1.s
