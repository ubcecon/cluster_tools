## Setting up Remote Editing on VScode

1. Ensure that you setup the `config` file correctly in the [Setup](setup.md#generate-keys-and-set-configuration-for-login)
2.  Install the [SFTP](https://marketplace.visualstudio.com/items?itemName=liximomo.sftp) Extension
3.  `Ctrl+Shift+P` to bring up the command palette, and run `> SFTP: config`
4.  Change the opened `sftp.json` (replacing `USERNAME`)
```
{
    "name": "Cedar",
    "host": "cedar",
    "protocol": "sftp",
    "port": 22,
    "username": "USERNAME",
    "remotePath": "/home/USERNAME",
    "uploadOnSave": true
}
```
5. On the left hand panel, choose `Cedar`  and you should a connection.


*Note:* The [Remote Development Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extension doesn't seem to work because VSCode can't install the server extensions
