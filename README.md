# Documentation and Tools for Accessing Compute Canada

**Note for Windows**: if you are on Windows you need to get a `ssh` terminal.
- Any version of Windows 10 that is up to date enables `ssh` by default in `cmd` or in `powershell`. We recommend `powershell` because i) it is a modern terminal; ii) it is sufficient for cluster executions.
- For anyone interested in incorporating a Unix/Linux environment on Windows, one of the most convenient ways is to use Windows Subsystem for Linux (WSL). See [WSL](https://github.com/ubcecon/tutorials/blob/master/WSL.md) for Windows installation instructions to get Ubuntu terminals in Windows.
- There are other alternatives that support `ssh` on Windows such as Putty and MobaXTerm. [MobaXTerm](https://docs.computecanada.ca/wiki/Connecting_with_MobaXTerm) is officially supported by ComputeCanada. Both of them allow 3rd-party, light-weight access to the cluster, but you won't have a fully functional Unix/Linux environment. This would potentially cause problems when you manipulate the files. Instead of using these 3rd-party terminals, we recommend `powershell` on Windows.

## Getting started

0. Establish an `ssh` supporting environment
1. [Apply for a Compute Canada Account](https://www.computecanada.ca/research-portal/account-management/apply-for-an-account/)
   - If you are a grad student, RA, etc. you will need a faculty sponsor, who will need a ComputeCanada account themselves
   - You will need them to provide you their ComputeCanada **CCRI** which is a form like `abc-123-01`
2. Follow [Setup Instructions](setup.md) to establish connection to ComputeCanada servers
3. Follow [Remote Editing](atom_remote_edit.md) to allow Atom editor to edit files on the server. This step is optional unless you are going to run interactive `julia` jobs on the cluster.

You can utilize resources on the cluster in several ways:
1. Run multi-core interactive jobs through command prompt:
   ```bash
   salloc --time=1:0:0 --nodes=1 --cpus-per-task=4
   ```
   see [SLURM basics](SLURM_basic.md) for more details.
1. Run an [Interactive Jupyter Job](jupyter_jobs.md) accessed from your local machine
1. Run a GUI-supported interactive job (like MATLAB) with [Virtual Network Computing](vnc_interactive.md)
1. Submit non-interactive jobs:
   - [Non-interactive Julia jobs](julia_jobs.md)
   - [Non-interactive MATLAB jobs](matlab_jobs.md)
1. (Unfinished) Run [remote, interactive julia sessions](julia_remote_interactive.md) with Atom and Juno environments.

**Notes**:
- As a large shared grid, ComputeCanada uses SLURM job scheduler ([What is a scheduler?](https://docs.computecanada.ca/wiki/What_is_a_scheduler%3F)) to allocate resources.
- Run only small scale tasks on the login node. Do not ask for lots of cores/memories and run heavy-duty jobs on the login nodes, or you may **get penalized** by ComputeCanada administrators.
- ComputeCanada **does not allow** you to submit any SLURM job under your `/home` directory. Make sure you current working directory is in `/project` or `/scratch` on the server.

## More on Compute Canada
- List of [Available Software](https://docs.computecanada.ca/wiki/Available_software)
- For more on our [Interactive Jupyter Job](jupyter_jobs.md) see may be easier
    - [Jupyter](https://docs.computecanada.ca/wiki/Jupyter) and more on [`ssh` Tunnelling](https://docs.computecanada.ca/wiki/SSH_tunnelling).

## Tools for UBC ARC Sockeye System
[UBC ARC Sockeye](https://arc.ubc.ca/ubc-arc-sockeye) is an internal computing cluster for UBC. The ways to utilize this cluster is similar to ComputeCanada, You need an `ssh` supporting environment as well. There are mainly two differences: 1) ARC Sockeye uses MFA, and therefore `sftp` is preferred in transferring data back and forth; 2) ARC Sockeye uses PBS job scheduler. 
