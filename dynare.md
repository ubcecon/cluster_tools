# Dynare installation on a Linux cluster

Sometimes you just want to run Dynare on a cluster but unfortunately there's no official documentation for it. So here's how.

1. Load the required modules that Dynare requires. For Compute Canada you can simply do 
   ``` bash
   module load matlab boost bison gsl matio
   ```

2. Find Matlab directory by `whereis matlab`, and copy everything before the `/bin/matlab` part. For Cedar of Compute Canada, it will be `/cvmfs/restricted.computecanada.ca/easybuild/software/2020/Core/matlab/2021a.1/bin/matlab`.

3. Make Dynare directories by `mkdir -p ~/dynare`

4. Git pull the source by `git clone --recurse-submodules --single-branch --branch 4.6 https://git.dynare.org/Dynare/dynare.git dynare/stable-4.6`. This example fetches the stable version at 4.6. You could also do `git clone --recurse-submodules --single-branch --branch master https://git.dynare.org/Dynare/dynare.git dynare/unstable` for an unstable version.

5. Compile Dynare
   ``` bash
   cd stable-4.6 # or replace wherever dynare is copied to
   autoreconf -si
   ./configure --with-matlab=/cvmfs/restricted.computecanada.ca/easybuild/software/2020/Core/matlab/2021a.1/bin/matlab --disable-octave --disable-doc --disable-dynare++ --disable-mex-kalman-steady-state # replace the matlab path
   make -j20
   ```

6. You might want to download and compile `x13as` if you haven't done that: (for more information about `x13as` check [here](https://www.census.gov/srd/www/x13as/x13down_pc.html))

   ``` bash
   cd ~/x13as
   wget https://www.census.gov/ts/x13as/unix/x13assrc_V1.1_B39.tar.gz
   tar xf x13assrc_V1.1_B39.tar.gz
   sed -i "s|-static| |" makefile.gf # this removes '-static'
   make -f makefile.gf FFLAGS="-O2 -std=legacy" PROGRAM=x13as # use legacy mode
   ln -s ~/x13as/x13as ~/.local/bin
   ```

After all this, you need to `addpath` in your job submission file to make sure that Dyanre path can be found by Matlab. Then you are good to go!
