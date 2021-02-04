### appliance-os

Ansible playbooks to configure a Kubernetes cluster node/master.


Start Multipass machine locally:

```bash
multipass launch -d 16G -m 4G -n os-builder -c 4
```

Paste your public key in:

```bash
multipass exec os-builder nano .ssh/authorized_keys
```

Retrieve the machine IP

```bash
multipass info os-builder | grep IPv4
```

Edit the `host` variable in [all.yml](inventory/sample/group_vars/all.yml) file with the retrieved IP.

Set the the cluster token value

```bash
export CLUSTER_TOKEN=<token>
```

Run the playbook:

```bash
ansible-playbook playbook.yml -i inventory/sample/hosts.yml --extra-vars "cluster_master_token=$CLUSTER_TOKEN"
```

The OS images will be in the local machine under: `target/` folders