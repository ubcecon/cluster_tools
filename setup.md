# Installation instructions on your desktop
First, if on Windows, then get Ubuntu on WSL with [WSL](WSL.md) and open an ubuntu terminal.  After that, all OS have the same instructions.

## Create an environment variable 
While not strictly needed, an environment variable for your username will help significantly.  If your login is `YOURUSERNAME` then run
```bash
export CCUSER=YOURUSERNAME
```
Additionally, add it to your `.bashrc`,
```bash
vim .bashrc
```
Then add `export CCUSER=YOURUSERNAME` at the bottom

In vim, you go `<ESC> i` to enter insert mode, make your changes, and then `<ESC> :wq!` to save and exit.

## (Optional) Generate Keys for login

1. Login to compute canada using your login and password (choosing `yes` to connect anyways)
```bash
ssh cedar.computecanada.ca
```
2. Then close the connection by typing `exit`
3. If needed, get ssh keys by running the following, and accepting the default location (e.g. `~/.ssh/id_rsa.pub`) and you can add a passphrase if you wish
```bash
ssh-keygen
```
4. Then attach the ssh to the computecanada, where you should replace `$CCUSER` if you did not set that environment variable above.
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub $CCUSER@cedar.computecanada.ca
```
   - You will need to login with your password again, but afterwards you will not need to login when you use the `ssh` to that server

# Installation Instructions on the Cluster

1. Log on to the cluster with `ssh cedar.computecanada.ca` and make sure to stay in your home `~` directory
2. To fully automate an (opinionated) setup, type
```bash
git clone https://github.com/ubcecon/cluster_tools.git
```
3. Then run the built in setup script (warning: this will replace your `.bashrc` and delete `.julia` and a few others)
```bash
bash ~/cluster_tools/bin/setup_cluster.sh
```
4. This should take 5'ish minutes for the full setup.  After it is done, type `exit` to close the cluster, reshell in, and you should be good to go.


Note: If the `cluster_tools` are modified and you want to redo the setup, simply go in order,
```bash
cd cluster_tools
git pull
cd ..
bash ~/cluster_tools/bin/setup_cluster.sh
```
