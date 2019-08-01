## Install WSL from Ubuntu and Conda

To get "Ubuntu on Windows" and other linux kernels see [instructions](https://docs.microsoft.com/en-us/windows/wsl/install-win10) or:
1. Run `powershell` as an administrator (i.e. right-click on the icon and choose `Run as Administrator`
2. Run `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`   and a reboot may be required
3. Download a distribution such as [Ubuntu 18.04](https://aka.ms/wsl-ubuntu-1804) to your desktop
    - Or choose from other [distros](https://docs.microsoft.com/en-us/windows/wsl/install-manual#downloading-distros)
5. Double-click on the downloaded `.appx` file to install follow instructions
    - Create a unix username and password
    - No need for these to match your windows login, but it may be convenient (especailly the login)

Hint on copy-past:  One way to paste into a windows terminal (of any sort) is the `<ctrl-c>` text somewhere else and then, while selected in the terminal at the cursor, to `<right click>` the mouse (which pastes)

## Installing Conda
1. In the ubuntu terminal, first install python/etc. tools
```bash
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
bash Anaconda3-2019.07-Linux-x86_64.sh
```
2. The installation will take time.  You should:
   - accept default paths
   - accept licensing terms
   - *IMPORTANT* Manually choose `yes` too have it do the `conda init` 
3. Install the ssh tunneling tool
```bash
pip install sshuttle
```

## More Administration Tips
- (Optional): Consider activating the newest version https://docs.microsoft.com/en-us/windows/wsl/wsl2-install
- You can reset your ubuntu setup by
  - Searching for ubuntu from the main "Start" icon, right-click on the "Ubuntu" app, Choose "App Settings", then choose "Reset"
