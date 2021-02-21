### appliance-os

Ansible playbooks to configure Mekom's appliance Operating System.

Key features of the OS are:
- Kubernetes cluster
- Autorunner service



Start Multipass machine locally:

```bash
multipass launch -d 16G -m 6G -n os-builder -c 4
```

Paste your public key in:

```bash
multipass exec os-builder nano .ssh/authorized_keys
```

Retrieve the machine IP to further set the `vm_ip` variable.

```bash
multipass info os-builder | grep IPv4
```

Genete a token for the nodes to auto join the master:
on MacOS:
```
uuidgen | tr '[:upper:]' '[:lower:]'
```
On Linux
```
uuid
```
Compulsory variables:

| Variable name  | Description |
| ------------- | ------------- |
|  `cluster_token` | A unique token that'll be shared between master and nodes to identify as part of the same cluster. On MacOS, you can use `uuidgen | tr '[:upper:]' '[:lower:]'` (Linux `uuid`) to get a random value |
| `vm_ip`  | The IP address of the host VM that Ansible must connect to in order to prepare the OS image and start the Qemu machine (could be of any CPU arch) |
| `gateway_ip`  | The IP address of the production router |
| `rpi_static_ip`  | Host-specific IP of each RPi, **to be set in the hosts.yml file** |

Run the playbook by replacing all the variable accordingly:

```bash
ansible-playbook playbook.yml -i inventory/sample/hosts.yml --extra-vars "cluster_token=<cluster_token> vm_ip=<host_vm_ip> gateway_ip=<gateway_ip>"
```

The OS images will be in the local machine under: `target/` folders
