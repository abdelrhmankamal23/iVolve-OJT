
 ```
 sudo apt install python3
 sudo apt install python3-pip
 sudo apt install python3-boto3
 ```
 also the aws cli through [Installing or updating to the latest version of the Amazon CLI](https://docs.amazonaws.cn/en_us/cli/latest/userguide/getting-started-install.html) documentation  

Create the ansible.cfg file and add  the `aws_ec2` plugin in it

#### How Ansible Finds Its Config File
When you run Ansible, it looks for ansible.cfg in the following order:  
1- ANSIBLE_CONFIG environment variable (if set)
2- ansible.cfg in the current working directory
3- ~/.ansible.cfg in your home directory
4- /etc/ansible/ansible.cfg

Configure your aws profile through  
```
aws configure
```
The above command store your credentials (access key and secret access key) in `~/.aws/credentials` and the `~/.aws/config` have your configuration settings (region and output format) for your aws profiles  

`ansible_ssh_common_args: '-o StrictHostKeyChecking=no'` in [AZ_2a.yaml](../Ansible/group_vars/AZ_2a.yaml) is to prevent the `Are you sure you want to continue connecting (yes/no/[fingerprint])?` prompt when connecting to new hosts
