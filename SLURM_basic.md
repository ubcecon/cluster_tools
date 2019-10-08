# Basic commands for SLURM and file transfer

## SLURM related commands
- Submit a job: `sbatch myscript.s`, the script file contains SLURM arguments
- List current (pending and running) jobs for some user: `squeue -u YOURUSERNAME`
- Cancel a job: `scancel JOBID`, where you can check `JOBID` from the `squeue` command above

## SLURM script file options
- `--job-name` name of the job
- `--mail-user=<email_address>` Email notifications of the jobs
- `--mail-type` this can be `BEGIN`, `END`, and `FAIL`. You can add multiple lines of `--mail-type` in your script
- `--cpus-per-task` the number of CPUs that share the same access
- `--nodes` the number of physical nodes to use. In most cases for parallel computation we set `--nodes=1`
- `--mem` memory can be in MB or GB
- `--time=hh:mm:ss` when the job reaches time limit it will be automatically terminated

## File transfer
It is recommended to edit the `~/.ssh/config` file to rename the cluster. In this way you don't have to retype a long server name or your username/password every time. See the optional part of [setup](setup.md) for details.

Copy files and folders from local machine to `cedar`: `scp FILENAME_ON_LOCAL_MACHINE cedar:~/FILEPATH_ON_CLUSTER`
