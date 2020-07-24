# Modules on Server

Software can be loaded/unloaded using the `module` command.

1. Basic Module Commands
    - `module avail`: shows a list of modules available
    - `module list`: shows a list of **loaded** modules
    - `module load <name>` and `module unload <name>`: loads/unloads a module
    - `module purge`: unload all modules

1. `module spider` detects module dependencies. For example, module `julia/1.4.1` depends on `gcc/7.3.0` while the default loaded `gcc` is `gcc/5.4.0`. Therefore, running `module spider <name>` will find the dependent modules.
