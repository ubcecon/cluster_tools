# Scheduled Non-interactive Julia jobs

1. Learn some [basic SLURM and file transfer commands](SLURM_basic.md)
1. Go to `/example/julia/` in this repository, and copy `submit.sh` and `template.s` to the folder where your Julia file resides
1. Run `bash submit.sh YOUR_FUNCTION_NAME`

An example is provided in this repository under `/example/julia/`.

**Notes**:
- The latest `julia` version on ComputeCanada is `1.2.0`, and we use `Distributed` library here in the example. We are going to substitute that by multi-threading once `julia 1.3.0` is out;
- There are two ways to run parallel loops: `@distributed` macro or `pmap` function. The rule of thumb is to use `@distributed` if the executions inside the parallel loop is simple. Check [here](https://docs.julialang.org/en/v1/manual/parallel-computing/#Parallel-Map-and-Loops-1 ) for more details;
- Use [`SharedArrays`](https://docs.julialang.org/en/v1/manual/parallel-computing/#man-shared-arrays-1) if multiple cores are reading from / writing to the same array. This won't be necessary once multi-threading is out.
