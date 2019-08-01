# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
module load gcc/7.3.0
module load julia/1.1.1
module load python/3.6

export JULIA_NUM_THREADS=10 # unclear whether this is a good idea