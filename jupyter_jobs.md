# Scheduled Jupyter Jobs
Clusters are inherently based on scheduling of jobs. To use Jupyter interactively, you need to schedule an **interactive** job and then connect to it from your local machine.

1. In one terminal, login to ComputeCanada, and run the launching codes **on the cluster**
```bash
bash ~/cluster_tools/bin/launch_jupyter.sh
```

2. Wait until the server allocates you some resources (i.e., once you see output like `salloc: Nodes cdr768 are ready for job`). 

  Then in another terminal **on your local machine**, start a tunnel (replacing the cdrXXX and username if required)
```bash
ssh -L 8888:cdrXXX.int.cedar.computecanada.ca:8888 $CCUSER@cedar.computecanada.ca -N -f
```

3. The original terminal (connected via `ssh` to the cedar cluster) should output a Jupyter link like `http://127.0.0.1:8888/?token=2ba204c33623ae06691da66a38df52a31e44a9c87acc28a4`. 

4. (For Windows only) Terminate the `ssh` session from Task Manager on your local machine after you finished running the Jupyter notebook or if you are going to launch a new task.

Copy the link from the cluster terminal with token, and open that webpage with any of your web browsers (Chrome, Firefox, etc).

Note: These codes submit an interactive job to the cluster behind the scenes. ComputeCanada uses [SLURM](https://docs.computecanada.ca/wiki/Running_jobs) scheduling system. The Jupyter notebooks created in this way will be stored on the cluster under directory `$HOME/scratch/`.
