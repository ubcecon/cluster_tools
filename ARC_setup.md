# Setup Instructions for UBC ARC Sockeye

Going through the official [documentation](https://confluence.it.ubc.ca/display/UARC/UBC+ARC+Technical+User+Documentation) is always beneficial.
**Note:** You have to be either on campus or using UBC VPN before connecting to ARC Sockeye or checking the documentation.

## Login and Key Generation

Once you've got an `ssh` supported terminal and connected to UBC network, run
```bash
ssh YOUR_CWL_ID@sockeye.arc.ubc.ca
```
then you'll be asked to enter your password (for your CWL account), and go through MFA. MFA will be through the options you provide (both through text message and through DUO).

To avoid entering password every time when you log in, you can create a configuration file and generate `ssh` keys. **Note**: there is no way to skip the MFA part while the password entry part will be skipped.
1. Open your terminal (`powershell` if on Windows), type `ssh-keygen` and run. Accept the default location if asked. **Do not replace** the file (by typing `n`) if `id_rsa` already exists.
1. Copy your `ssh` key to ARC Sockeye,

  **Linux / Mac OS**
  ```bash
  ssh-copy-id -i ~/.ssh/id_rsa.pub YOUR_CWL_ID@sockeye.arc.ubc.ca
  ```
  **Windows Powershell**
  ```powershell
  cat ~/.ssh/id_rsa.pub | ssh YOUR_CWL_ID@sockeye.arc.ubc.ca "cat >> ~/.ssh/authorized_keys"
  ```
  You'll need to enter your password again.
1. You can set up a `config` file to simplify that `ssh` command
    - Open a text editor and enter the following
    ```bash
    Host sockeye
	      User YOUR_CWL_ID
	      Hostname sockeye.arc.ubc.ca
	      IdentityFile ~/.ssh/id_rsa
    ```
	- Save the file to `~/.ssh/config`.
    - After that you only need to `ssh sockeye` to log in.

## Transferring Files from/to the Cluster
While `scp` is well-supported, you have to go through MFA every time. Therefore, a better option is `sftp`. By keeping the `sftp` session alive you will only have to go through MFA once.

The command is
``` bash
sftp YOUR_CWL_ID@dtn.sockeye.arc.ubc.ca
```
Notice that you can upload a key to `dtn.sockeye.arc.ubc.ca` as well.

## Submit Tasks
UBC ARC Sockeye uses PBS job queueing system (you can find the full manual [here](https://www.altair.com/pdfs/pbsworks/PBSUserGuide19.2.3.pdf), and UBC ARC provides a command comparison table [here](https://confluence.it.ubc.ca/display/UARC/Running+Jobs#RunningJobs-SlurmtoPBSTranslation)). Judging from the user's frontend, PBS is not very different from SLURM.

### PBS related commands
- Submit a job: `qsub myscript.s`, the script file contains SLURM arguments
- List current (pending and running) jobs for some user: `qstat -u YOUR_CWL_ID`
- Cancel a job: `qdel JOBID`, where you can check `JOBID` from the `qstat` command above

### PBS script file options
- `-N` name of the job
- `-M [email_address]` Email notifications of the jobs
- `-m mail-type abe` for `Abort`, `Begin`, and `End`
- `-l mem=[size][mb/gb]` memory can be in MB or GB
- `-l walltime=[hh:mm:ss]` when the job reaches time limit it will be automatically terminated
