## Jupyter Jobs
Clusters are inherently based on scheduling of jobs, however for small things you can test without scheduling.

## On the Cluster
In a ssh shell from home simply run
```bash
bash cluster_tools/bin/notebook.sh
```

## On the Desktop

Then in another screen start a tunnel (replacing the cdrXXX and username)
```julia
ssh -L 8888:cdrXXX.int.cedar.computecanada.ca:8888 USERNAME@cedar.computecanada.ca
```


There are a few options, depending on the number of resources:

Tunneling:  `sshuttle --dns -Nr $CCUSER@cedar.computecanada.ca` should work but isn't.  Why not?

Alternatively, try replacing he `XXX` with the cluster number
```
ssh -L 8888:cdrXXX.int.cedar.computecanada.ca:8888 USERNAME@cedar.computecanada.ca
```