# Installation instructions
First, if on Windows, make sure the system is updated (any version of an updated Windows 10 would work). You can choose either to stick with `powershell` or install [WSL](https://github.com/ubcecon/tutorials/blob/master/WSL.md), then follow either of the two:

- Run Powershell in `Run as Administrator` mode. Follow instructions for Windows.

- Get Ubuntu on with [WSL](https://github.com/ubcecon/tutorials/blob/master/WSL.md) and open an Ubuntu terminal. Follow instructions for Linux / Mac OS after that. Always start with your `$HOME` directory by `cd ~`.

Through out the instruction we use [Cedar](https://docs.computecanada.ca/wiki/Cedar) cluster on [ComputeCanada](https://www.computecanada.ca/). You can also try other clusters by yourself, see [List of Clusters](https://www.computecanada.ca/research-portal/accessing-resources/available-resources/).

## Create an environment variable and Login
1. While not strictly needed, an environment variable for your username will help significantly.

	**Linux / Mac OS**

	If your login is `YOURUSERNAME` then run
	```bash
	export CCUSER=YOURUSERNAME
	```
	Additionally, add it to your `.bashrc`,
	```bash
	vim .bashrc
	```
	Then add `export CCUSER=YOURUSERNAME` at the bottom

	In Vim, you go `<ESC> i` to enter insert mode, make your changes, and then `<ESC> :wq!` to save and exit (`:w` means to save, `:q` means to exit, you can also type `:help` for more details).

	**Windows Powershell**

	If your login is `YOURUSERNAME` then run
	```powershell
	[Environment]::SetEnvironmentVariable("CCUSER", "YOURUSERNAME", "Machine")
	```
	to add an global, persistent environment variable. You can also manually add this environment variable through **Control Panel**.

2. You can login to ComputeCanada using your username and password.

	**Linux / Mac OS**
	```bash
	ssh $CCUSER@cedar.computecanada.ca
	```
	**Windows Powershell**
	```powershell
	ssh $env:CCUSER@cedar.computecanada.ca
	```
	The first time you login to the cluster, it will add a fingerprint to your local machine. Type `yes` when you encounter that question.

3. To close the connection, type `exit` and enter, then close the terminal.

## Generate Keys and Set Configuration for Login

To make your life easier in logging into the cluster and transferring files from and to the cluster, we create a configuration file and generate `ssh` keys for that.

1. Open your terminal (`powershell` if on Windows), type `ssh-keygen` and run. Accept the default location if asked. The default location is `~/.ssh/id_rsa.pub` (Windows users: you can `cd ~` in `powershell` as well. The directory `~` is equivalent to `C:\Users\YOURUSERNAME`. You can use either `/` or `\` in navigating to directories)
2. Then attach the `ssh` key to ComputeCanada, where you should replace `$CCUSER` with your own username if you did not set that environment variable above.

    **Linux / Mac OS**
    ```bash
    ssh-copy-id -i ~/.ssh/id_rsa.pub $CCUSER@cedar.computecanada.ca
    ```
    **Windows Powershell**
    ```powershell
    cat ~/.ssh/id_rsa.pub | ssh $env:CCUSER@cedar.computecanada.ca "cat >> ~/.ssh/authorized_keys"
    ```

    You will need to login with your password again, but afterwards you will not need to login when you `ssh` to that server.
5. Set up a `config` file to simply `ssh` and `scp` processes
    - Open a text editor and enter the following (with your own ComputeCanada username replaced)
    ```bash
    Host cedar
	      User YOURUSERNAME
	      Hostname cedar.computecanada.ca
	      IdentityFile ~/.ssh/id_rsa
    ```
	- Save the file to `~/.ssh/config`.
    - After that you only need to `ssh cedar` and `scp cedar` when logging on or copy files from the cluster

# Environment Preparation on the Cluster

1. Log on to the cluster with `ssh cedar` and make sure to stay in your home `~` directory by typing `cd ~`

2. To fully automate an (opinionated) setup, type
```bash
git clone https://github.com/ubcecon/cluster_tools.git
```
This setup will install the environment you need for Jupyter Notebooks in Julia.

3. Then run the built in setup script (warning: this will replace your `.bashrc` and delete `.julia` and a few others)
```bash
bash ~/cluster_tools/bin/setup_cluster.sh
```

4. This should take 5'ish minutes for the full setup.  After it is done, type `exit` to close the cluster, reshell in, and you should be good to go.

Note: If the `cluster_tools` are modified and you want to redo the setup, simply execute:
```bash
cd cluster_tools
git pull
cd ..
bash ~/cluster_tools/bin/setup_cluster.sh
```
