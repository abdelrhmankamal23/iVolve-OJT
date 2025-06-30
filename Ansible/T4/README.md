## Generate a new keypair and attach it to the managed nodes

Key generation 
```
ssh-keygen
```
To add the public key new generated keypair to one specific node. Note that the keypair will not work unless the permission is 600.
```
ssh-copy-id -i ~/.ssh/ivolvekey.pub ubuntu@10.245.184.150
```
Created the [inventory.yaml](../T4/inventory.yaml) and the [copypubkey.yaml](../T4/copypubkey.yaml)  

Note that `key: "{{ lookup('file', '~/.ssh/ivolvekey.pub') }}"` uses the lookup function to fetch data from outside the playbook, it has several plugins where each one retrieves information in a different way here we used `file` lookup plugin that reads the contents of a file from the control machine and returns the raw content of that file as a strings.  

Run the playbook  

```
ansible -i inventory.yaml copypubkey.yaml
```
We can run the playbook on all hosts in the inventory, choose certain group from it,select multiple hostnames/nodes separated by colon, or select one certain node  

```
ansible all -i inventory.yaml -m shell -a "df -h"
ansible webservers -i inventory.yaml -m shell -a "df -h"
ansible web1 -i inventory.yaml -m ping
ansible web1:db1 -i inventory.yaml -m ping
```