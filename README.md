### openmrs-appliance-playbooks

Ansible playbooks to configure a Kubernetes cluster.

Edit the [hosts.yml](hosts.yml) file with the K8s nodes IPs and user.

Run the playbook:

```
ansible-playbook -i hosts.yml  playbook.yml
```
