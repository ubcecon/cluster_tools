# Documentation and Tools for Accessing Compute Canada

**Note for Windows**: if you are on Windows you need to get a SSH terminal.
- Any version of Windows 10 that is up to date enables SSH by default in `cmd` or in `powershell`. We recommend `powershell` because i) it is a modern terminal; ii) it is sufficient for cluster executions.
- For anyone interested in incorporating a Unix/Linux environment on Windows, one of the most convenient ways is to use Windows Subsystem for Linux (WSL). See [WSL](WSL.md) for Windows installation instructions to get Ubuntu terminals in Windows.
- There are other alternatives that support SSH on Windows such as Putty and MobaXTerm. [MobaXTerm](https://docs.computecanada.ca/wiki/Connecting_with_MobaXTerm) is officially supported by ComputeCanada. Both of them allow 3rd-party, light-weight access to the cluster, but you won't have a fully functional Unix/Linux environment. This would potentially cause problems when you manipulate the files. Instead of using these 3rd-party terminals, we recommend `powershell` on Windows.

## Getting started

0. Establish an SSH supporting environment
1. [Apply for a Compute Canada Account](https://www.computecanada.ca/research-portal/account-management/apply-for-an-account/)
   - If you are a grad student, RA, etc. you will need a faculty sponsor, who will need a ComputeCanada account themselves
   - You will need them to provide you their ComputeCanada **CCRI** which is a form like `abc-123-01`
2. Follow [Setup Instructions](setup.md) to establish connection to ComputeCanada servers
3. Follow [Remote Editing](atom_remote_edit.md) to allow Atom editor to edit files on the server

After you have done the initial setup you can run your codes in several ways:
- Run your programs on a login node (for small tests ONLY).  Do not ask for lots of resources this way!  It isn't how clusters work as the resources on login nodes are limited. You may **get penalized** by system administrators if you insist to run heavy-duty jobs on login nodes.
- Run multiple-core interactive jobs through command prompt:
```bash
salloc --time=1:0:0 --nodes=1 --cpus-per-task=4
```
this example grants you access to 4 physical cores with shared memory for one hour (see [SLURM](SLURM_basic.md) for further explanations). This is useful when you experiment your code before submitting a serious job. **Note**: ComputeCanada does not allow you to submit any job under your home directory. Make sure you current working directory is in `\project` or `\scratch` on the server.
- Run an [Interactive Jupyter Job](jupyter_jobs.md) accessed from your local machine
- Submit non-interactive, distributed computing jobs: [Julia](julia_jobs.md), [MATLAB](matlab_jobs.md)

## More on Compute Canada
- List of [Available Software](https://docs.computecanada.ca/wiki/Available_software)
- For more on our [Interactive Jupyter Job](jupyter_jobs.md) see may be easier
    - [Jupyter](https://docs.computecanada.ca/wiki/Jupyter) and more on [SSH Tunnelling](https://docs.computecanada.ca/wiki/SSH_tunnelling).
