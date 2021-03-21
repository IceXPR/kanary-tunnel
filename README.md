# kontainer-tunnel
Tunnel to a Virtual Machine in the clouds to a private Kubernetes cluster.

Testing
``` bash
curl endpoint-traefik:80 -H Host:cname
```

Build
```
docker build -t code4clouds/canary-tunnel:20210307171837 .
docker push code4clouds/canary-tunnel:20210307171837
```

Create the VM in Azure and generate certificate

Ensure you have read-only access to the private key.
``` bash
chmod 400 azureuser.pem
```
Provide a path to your SSH private key file.
Private key path
~/.ssh/azureuser
Run the example command below to connect to your VM.
``` bash
ssh -i <private key path> azureuser@vm
```

Protect your VM
``` bash
sudo ufw enable
sudo ufw start
sudo ufw status
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
```

Enable port redirect
``` bash
sudo apt install socat
crontab -e
@reboot sudo socat TCP-LISTEN:80,fork TCP:localhost:8080
@reboot sudo socat TCP-LISTEN:443,fork TCP:localhost:8443 
```

Add your .pem to your cluster
```
kubectl create secret generic kanary-tunnel --from-file=./kanary-container_key.pem
```


