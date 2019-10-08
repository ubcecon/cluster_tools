# Example for Julia parallel computing on ComputeCanada

To run the example, copy all the files to your `$SCRATCH` folder on the cluster.

Then run the following code
```bash
bash submit.sh pi_parallel
```

You can check `slurm-XXXXX.out` for print output.

Moreover, you can change the core numbers defined in `run-pi_parallel.s` to see how the number of cores accelerate the computation.
