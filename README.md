# Ansible
This repo is continuously developing to have necessary ansible files.
Here, are some samples for ansible manager node to test with vagrant hosts, also physical hosts. The Goal is to make all configurations avalable with IaC standard which also can be usable for companies to define standard procedures for their staff to fallow. Besides, it can make developer's life easier to create Rolebooks to write their instructions in format of code so that they can be reusable by themselves and others in future. In can also be used somehow as a part of documentations of a project.
It's possible to login to your own host and play a playbook. just create a ssh key and add public key to ~/.ssh/authorized_keys
## folder organization
group_vars: include data that each host in that group may needed or applied to it. For each group vars, a folder is added.

host_vars: include data that each host may needed or applied to it. For each host there is also a folder. 

inventory: hosts are written in this file and assigned to various groups 
## Vault
for each host there is a vault file that has been encrypted which contains data for loging in to host. It will be Placed in host_vars.
to encrypt file:
```
ansible-vault encrypt host_vars/dell/vault.yml 
```
to decrypt file:
```
ansible-vault decrypt host_vars/dell/vault.yml 
```
to edite encrypted file:
```
ansible-vault edit host_vars/dell/vault.yml
```
## Ad-hoc commands
These command are just use for tests

### Ping
for ping host or groups the fallowing command will be used
```
ansible all -m ping -i inventory/hosts.yml --ask-vault-pass # for using data in vault encrypted files
```
or you can use ping playbook
```
ansible-playbook -i inventory/hosts.yml playbook_ping.yaml --ask-vault-pass
```
To ping specific inventory hosts or groups use ansible-playbook as fallow:
```
ansible-playbook -i inventory/hosts.yml -l pcs  playbook_ping.yaml --ask-vault-pass
```