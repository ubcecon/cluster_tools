# Run Interactive Remote Julia in Juno

1. Install Atom/Juno: See [QuantEcon instructions](https://julia.quantecon.org/more_julia/tools_editors.html#Atom).

1. Once you set up [remote editing](atom_remote_edit.md), in Atom go to `Juno->Settings->Remote Options` and set `Command to execute Julia on the remote server` to be `/home/YOURUSERNAME/cluster_tools/bin/launch_juno.sh`

![](src/juno-step-2.png)

1. Run `command-shift-p` and enter `Start Remote Julia Process`. Then you can run it as if it was on the local machine.

![](src/juno-step-3.png)
