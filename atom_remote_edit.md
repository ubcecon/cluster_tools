# Setting up Remote Editing using Atom

[Atom](https://atom.io/) is a modern, hackable text editor to which you can add packages. Using this editor we can edit the files remotely on the cluster and synchronize via `sftp` -- `ftp` through `ssh`.

Once you completed connecting to ComputeCanada with `ssh`, follow these steps to set remote editing on the cluster from your local machine:

1. Install Atom package `ftp-remote-edit` by clicking `File->Settings->Install` and type `ftp-remote-edit` in the search bar.
1. After completion of installation, press `Ctrl+Space` to set your password to `ftp-remote-edit`. It is a mandatory step required by the package.
1. Press `Ctrl+Shift+p` on Windows (or `Command+Shift+p` on Mac) and enter `ftp remote edit` and find `Edit servers` command. Set the `hostname` of the cluster to be `cedar.computecanada.ca`, `protocol` to be `sftp`, and `logon method` to be `username/password`. Enter your `username` and `password` to ComputeCanada accordingly. Set the initial directory to be `/home/YOURUSERNAME`. After saving the configurations, click `test` to test connection. A blue bubble will pop up indicating success.
1. Now on the left panel inside Atom you can see `Remote`, and then double click on the server you just set. You can add/delete/edit files now, and they will be directly synchronized on ComputeCanada.
