## Jupyter Jobs
Clusters are inherently based on scheduling of jobs, however for small things you can test without scheduling.

## On the Cluster
1. In a ssh shell from home simply run
```bash
bash cluster_tools/bin/notebook.sh
```
2. You may need to copy the token in the resulting output, i.e. `http://127.0.0.1:8889/?token=db3b9295555994d69d68b69330368826b967da5bb62fd649` is `db3b9295555994d69d68b69330368826b967da5bb62fd649`

*NOTE* If it says that port `8889` was not available and it started on another port, then modify the tunneling below.

## On the Desktop

1. Start ssh tunnelling 
- Then in another screen start a tunnel
```bash
ssh -L 8889:127.0.0.1:8889 cedar.computecanada.ca -N -f
```
  - Alternatively (not on WSL!)
```bash
sshuttle --dns -Nr $CCUSER@cedar.computecanada.ca
```
2. In your local browser, go to `http://localhost:8889` (feel free to bookmark) and paste in token if necessary

**Remember** This is not intended for large jobs