# Using and launching Jupyter


## Launching ineractive notebook
In a ssh shell, you need to change out of home first,
```julia
cd /project
source $HOME/jupyter_py3/bin/activate
```
Then start an interactive job, such as 
```bash
salloc --time=1:0:0 --ntasks=1 --cpus-per-task=2 --mem-per-cpu=1024M --account=def-$USER srun $VIRTUAL_ENV/bin/notebook.sh
```

## Tunneling

Then in another screen start a tunnel (replaceing the cdrXXX and username)
```julia
ssh -L 8888:cdrXXX.int.cedar.computecanada.ca:8888 USERNAME@cedar.computecanada.ca
```


There are a few options, depending on the number of resources:

Tunneling:  `sshuttle --dns -Nr $CCUSER@cedar.computecanada.ca` should work but isn't.  Why not?

Alternatively, try replacing he `XXX` with the cluster number
```
ssh -L 8888:cdrXXX.int.cedar.computecanada.ca:8888 USERNAME@cedar.computecanada.ca
```