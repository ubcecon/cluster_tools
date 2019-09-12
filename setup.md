# Installation instructions on your desktop
First, if on Windows, make sure the system is updated (any version of an updated Windows 10 would work). You can choose either one of the two ways to set up your environment:

- Get Ubuntu on Windows Subsystem for Linux (WSL) with [WSL](WSL.md) and open an Ubuntu terminal. Follow instructions for Linux / Mac OS after that. Always start with your `$HOME` directory by `cd ~`.

- For those who are just going to try out Jupyter notebooks on the cluster, stay with Windows by using Powershell. Always run Powershell in `Run as Administrator` mode. Follow instructions for Windows.

Through out the instruction we use [Cedar](https://docs.computecanada.ca/wiki/Cedar) cluster on [ComputeCanada](https://www.computecanada.ca/). You can also try other clusters by youself, see [List of Clusters](https://www.computecanada.ca/research-portal/accessing-resources/available-resources/).

## Create an environment variable
While not strictly needed, an environment variable for your username will help significantly.

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

## (Optional) Generate Keys for login

1. Login to ComputeCanada using your login and password (choosing `yes` to connect anyways)

    **Linux / Mac OS**
    ```bash
    ssh $CCUSER@cedar.computecanada.ca
    ```
    **Windows Powershell**
    ```powershell
    ssh $env:CCUSER@cedar.computecanada.ca
    ```
2. Then close the connection by typing `exit`
3. If needed, get SSH keys by running the following, and accepting the default location (e.g. `~/.ssh/id_rsa.pub`) and you can add a passphrase if you wish
```bash
ssh-keygen
```
4. Then attach the SSH to the ComputeCanada, where you should replace `$CCUSER` if you did not set that environment variable above.

    **Linux / Mac OS**
    ```bash
    ssh-copy-id -i ~/.ssh/id_rsa.pub $CCUSER@cedar.computecanada.ca
    ```
    **Windows Powershell**
    ```powershell
    cat ~/.ssh/id_rsa.pub | ssh $env:CCUSER@cedar.computecanada.ca "cat >> ~/.ssh/authorized_keys"
    ```

    You will need to login with your password again, but afterwards you will not need to login when you use the `ssh` to that server.
5. (Optional) Setting up a `config` file will make your life even easier in logging into the cluster using `ssh` or copy files using  `scp`.
   **Linux /Mac OS**
    - Create a file `~/.ssh/config`
    - Enter the following (with your own ComputeCanada username replaced)
    ```bash
    Host cedar
	      User YOURUSERNAME
	      Hostname cedar.computecanada.ca
	      IdentityFile ~/.ssh/id_rsa
	      ForwardX11 yes
    ```
    **Windows Powershell**
    - Copy/paste and execute the following to generate the file
    ```powershell
	$file = @"
	Host cedar
	      User $Env:CCUSER
	      Hostname cedar.computecanada.ca
	      IdentityFile ~/.ssh/id_rsa
	      ForwardX11 yes
	"@
	$file | Out-File ~/.ssh/config
    ```
    - After that you only need to `ssh cedar` and `scp cedar` when logging on or copy files from the cluster

# Installation Instructions on the Cluster

1. Log on to the cluster with `ssh cedar` (or `ssh cedar.computecanada.ca` if you did not create the `~/.ssh/config` file)  and make sure to stay in your home `~` directory
2. To fully automate an (opinionated) setup, type
```bash
git clone https://github.com/ubcecon/cluster_tools.git
```
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
