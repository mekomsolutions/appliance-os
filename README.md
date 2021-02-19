### appliance-os

Ansible playbooks to configure a Kubernetes cluster node/master.


Start Multipass machine locally:

```bash
multipass launch -d 16G -m 6G -n os-builder -c 4
```

Paste your public key in:

```bash
multipass exec os-builder nano .ssh/authorized_keys
```

Retrieve the machine IP

```bash
multipass info os-builder | grep IPv4
```

Set the the host VM IP Value retrieved from the multipass

```bash
export HOST_VM_IP=<set vm IP>
```

Set the the cluster token value

```bash
export CLUSTER_TOKEN=<token>
```

Run the playbook:

```bash
ansible-playbook playbook.yml -i inventory/sample/hosts.yml --extra-vars "cluster_token=$CLUSTER_TOKEN vm_ip=$HOST_VM_IP"
```

The OS images will be in the local machine under: `target/` folders