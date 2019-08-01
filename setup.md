# Installation instructions
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
