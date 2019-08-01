## WSL and Conda
To get "Ubuntu on Windows" and other linux kernels see [instructions](https://docs.microsoft.com/en-us/windows/wsl/install-win10) or:
1. Run `powershell` as an administrator (i.e. right-click on the icon and choose `Run as Administrator`
2. Run `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`   and a reboot may be required
3. Download a distribution such as [Ubuntu 18.04](https://aka.ms/wsl-ubuntu-1804) to your desktop
4. Double-click on the downloaded `.appx` file to install follow instructions
  - Create a unix username and password.  No need for these to match your windows login, but the username can't hurt!

In the ubuntu terminal, first install python/etc. tools
```bash
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
bash Anaconda3-2019.07-Linux-x86_64.sh
```
The installation will take time.  You should:
- accept default paths
- accept licensing terms
- Manually choose `yes` too have it do the `conda init`

Close and reopen your shell

Then install the ssh tunneling tool.
```bash
pip install sshuttle
```

Optional: Consider activating the newest vesrion https://docs.microsoft.com/en-us/windows/wsl/wsl2-install