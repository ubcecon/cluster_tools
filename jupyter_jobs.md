## Scheduled Jupyter Jobs
Clusters are inherently based on scheduling of jobs.  To use jupyter interactively, you need to schedule an "interactive" job and then connect to it from your desktop

## On the Cluster
In a ssh shell, you need to change out of home first,
```julia
cd /project
source $HOME/jupyter_py3/bin/activate
```
Then start an interactive job, such as 
```bash
salloc --time=1:0:0 --ntasks=1 --cpus-per-task=2 --mem-per-cpu=1024M --account=def-$USER srun $VIRTUAL_ENV/bin/notebook.sh
```
(TODO: add in shell scripts to do all of these steps, and provided)

## On the Desktop

Then in another screen start a tunnel (replacing the cdrXXX and username if required)
```bash
ssh -L 8888:cdrXXX.int.cedar.computecanada.ca:8888 $CCUSER@cedar.computecanada.ca -N -f
```