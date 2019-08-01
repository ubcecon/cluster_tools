#!/bin/bash

wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
bash Anaconda3-2019.07-Linux-x86_64.sh

# IS THERE A WAY TO HAVE THIS MANUALLY SEND strings.
# Maybe https://linux.die.net/man/1/expect or sexpect?
# The sequence is 
  # <ENTER>
  # <space>
  # <space>
  # <space>
  # yes<ENTER>
  # <ENTER>
  # yes<ENTER>

~/anaconda3/bin/pip install sshuttle