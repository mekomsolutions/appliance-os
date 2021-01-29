### appliance-os

Ansible playbooks to configure a Kubernetes cluster node/master.


Edit the [hosts.ini](inventory/sample/hosts.ini) file with the correct IPs and users.

Set the the cluster token value

```bash
export CLUSTER_TOKEN=<token>
```

Run the playbook:

```bash
ansible-playbook playbook.yml -i inventory/sample/hosts.ini --extra-vars "cluster_master_token=$CLUSTER_TOKEN"
```
