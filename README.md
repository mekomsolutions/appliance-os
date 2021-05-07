## appliance-os

Ansible playbooks to configure Mekom's appliance Operating System.

Key features of the OS are:
- Kubernetes cluster
- Autorunner service

### Optional, start a VM with Multipass

Start Multipass machine locally:

```bash
multipass launch -d 32G -m 8G -n os-builder -c 4
```

Paste your public key in:

```bash
multipass exec os-builder nano .ssh/authorized_keys
```

Retrieve the machine IP to further set the `vm_ip` variable.

```bash
multipass info os-builder | grep IPv4
```

### Generate token

Genete a token for the nodes to auto join the master:
on MacOS:
```
uuidgen | tr '[:upper:]' '[:lower:]'
```
On Linux
```
uuid
```

### Set mandatory variables

Required variables:

| Variable name  | Description |
| ------------- | ------------- |
|  `cluster_token` | A unique token that'll be shared between master and nodes so they identify as part of the same cluster. On MacOS, you can use `uuidgen \| tr '[:upper:]' '[:lower:]'` (Linux `uuid`) to get a random value |
| `vm_ip`  | The IP address of the host VM for Ansible to connect to (might be the Multipass machine if applicable) and prepare the OS image as well as start the Qemu machine (could be of any CPU arch) |
| `gateway_ip`  | The IP address of the router used in production |
| `rpi_static_ip`  | **To be set in the [hosts.yml](inventory/sample/hosts.yml) file**. Host-specific IP of **each RPi** |
| `load_balancer_addresses`  | **To be set in the [hosts.yml](inventory/sample/hosts.yml) file**. Master-specific range of IP addresses needed by the Load Balancer to properly function. This range should be reserved for the load balancer, therefore excluding all nodes IPs as well as any DHCP range. |
| `registry_load_balancer_ip`  | The IP address of the container registry, inside the `load_balancer_addresses` range. |
| `common_name`  | **To be set in the [hosts.yml](inventory/sample/hosts.yml) file**. The Common Name of the target on the Mekom VPN |


#### VPN configuration

> **Tip:**  to skip VPN configuration
```
--extra-vars skip_vpn=true
```

Please provide **private** and **public keys** for each cluster node as well as the **CA chain** and the **client.conf** file, in the **certificates/** folder (create such folder at the root of this project) such as:
```
certificates/
 -- 123.example.net.key
 -- 123.example.net.crt
 -- 456.example.net.key
 -- 456.example.net.crt
 -- ...
 -- ca-chain.crt
 -- client.conf
```  

### Run the playbook

Run the playbook by replacing all the variable to the table above, inline as well as in [hosts.yml](inventory/sample/hosts.yml):

```bash
ansible-playbook playbook.yml -i inventory/sample/hosts.yml --extra-vars "cluster_token=<cluster_token> vm_ip=<host_vm_ip> gateway_ip=<gateway_ip> registry_load_balancer_ip=<registry_ip>"
```
