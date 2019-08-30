## Scheduled Jupyter Jobs
Clusters are inherently based on scheduling of jobs. To use Jupyter interactively, you need to schedule an **interactive** job and then connect to it from your local machine.

1. In one terminal, login to ComputeCanada, and run the launching codes **on the cluster**
```bash
bash ~/cluster_tools/bin/launch_jupyter.sh
```

    - Note: These codes submit an interactive job to the cluster. ComputeCanada uses [SLURM](https://docs.computecanada.ca/wiki/Running_jobs) scheduling system. The Jupyter notebooks created in this way will be stored on the cluster under directory `$HOME/scratch/`

2. Then in another terminal **on your local machine**, start a tunnel (replacing the cdrXXX and username if required)
```bash
ssh -L 8888:cdrXXX.int.cedar.computecanada.ca:8888 $CCUSER@cedar.computecanada.ca -N -f
```

3. Open webpage `http://127.0.0.1:8888` with any of your web browsers (Chrome, Firefox, etc).
