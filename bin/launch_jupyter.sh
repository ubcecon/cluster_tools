#!/bin/bash
cd scratch
source $HOME/jupyter_py3/bin/activate

salloc --time=1:0:0 --ntasks=1 --cpus-per-task=2 --mem-per-cpu=1024M srun $VIRTUAL_ENV/bin/notebook.sh
# jupyter lab --port=8889 --no-browser
