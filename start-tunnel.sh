#! /bin/sh
#ssh -L ${TRAEFIK_IP}:80:${VM_IP}:80 azureuser@${VM_IP} -i ./pem/kanary-container_key.pem -o "StrictHostKeyChecking=no" 
# ssh -vfN -R ${VM_IP}:8080:${TRAEFIK_IP}:80 azureuser@${VM_IP} -i ./pem/kanary-container_key.pem -o "StrictHostKeyChecking=no" 
# ssh -vR ${VM_IP}:8080:${TRAEFIK_IP}:80  azureuser@${VM_IP} -i ./pem/kanary-container_key.pem -o "StrictHostKeyChecking=no" -o ServerAliveInterval=60 sudo socat TCP-LISTEN:80,fork TCP:localhost:8080
# ssh -vfR ${VM_IP}:8443:${TRAEFIK_IP}:443 azureuser@${VM_IP} -i ./pem/kanary-container_key.pem -o "StrictHostKeyChecking=no" -o ServerAliveInterval=60 sudo socat TCP-LISTEN:443,fork TCP:localhost:8443
# ssh -vfR ${VM_IP}:8080:${TRAEFIK_IP}:80 azureuser@${VM_IP} -i ./pem/kanary-container_key.pem -o "StrictHostKeyChecking=no" -o ServerAliveInterval=60 sudo socat TCP-LISTEN:80,fork TCP:localhost:8080
#ssh -fnL ${VM_IP}:8081:${TRAEFIK_IP}:80 azureuser@${VM_IP} -N -i ./pem/kanary-container_key.pem 
## ssh -vR ${VM_IP}:8080:${TRAEFIK_IP}:80 -vR ${VM_IP}:8443:${TRAEFIK_IP}:443 azureuser@${VM_IP} -i ./pem/kanary-container_key.pem -o "StrictHostKeyChecking=no" -o "ServerAliveInterval=60"
# autossh -M 0 -f -q -N -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3"  -vR ${VM_IP}:8080:${TRAEFIK_IP}:80 -vR ${VM_IP}:8443:${TRAEFIK_IP}:443 azureuser@${VM_IP} -i ./pem/kanary-container_key.pem
autossh -M 0  -q -N -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3"  -vR ${VM_IP}:8080:${TRAEFIK_IP}:80 -vR ${VM_IP}:8443:${TRAEFIK_IP}:443 azureuser@${VM_IP} -i ./pem/kanary-container_key.pem