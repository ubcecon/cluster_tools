#!/bin/bash

# Only run in the home directory
cd ~

# clean up, just in case
rm -rf .julia
rm -rf .jupyter

# overwrite the current .bashrc file
\cp ~/cluster_tools/bin/.bashrc ~/.bashrc

# load modules, create virtual environments to make jupyter easier.
module load gcc/7.3.0
module load julia/1.1.1
module load python/3.6

# install jupyterlab
pip install jupyterlab

# install IJulia on top of jupyterlab
julia -e 'using Pkg; pkg"add IJulia"'