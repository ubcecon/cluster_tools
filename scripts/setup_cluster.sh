#!/bin/bash


# Only run in the home directory

cd ~
# clean up, just in case
rm -rf .julia
rm -rf .jupyter
rm -rf jupyter_py3


# overwrite the current .bashrc file
\cp ~/cluster_tools/scripts/.bashrc ~/.bashrc

# load modules, create virtual environments to make jupyter easier.
module load gcc/7.3.0
module load julia/1.1.1
module load python/3.6
virtualenv $HOME/jupyter_py3
source $HOME/jupyter_py3/bin/activate
pip install jupyterlab

# Install important julia pacakges and jupyter support
julia -e 'using Pkg; pkg"add IJulia"'

#Create utilities for working with notebooks
echo -e '#!/bin/bash\nunset XDG_RUNTIME_DIR\njupyter lab --ip $(hostname -f) --no-browser' > $VIRTUAL_ENV/bin/notebook.sh
chmod u+x $VIRTUAL_ENV/bin/notebook.sh