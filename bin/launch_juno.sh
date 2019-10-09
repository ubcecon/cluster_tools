cd scratch
chmod +x ~/cluster_tools/bin/setup_julia.sh
salloc --time=1:0:0 --ntasks=1 --cpus-per-task=2 srun ~/cluster_tools/bin/setup_julia.sh
