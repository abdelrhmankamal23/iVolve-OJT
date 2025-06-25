## Ansible Automation & Web Server Setup

### Introduction
This labs walks you through automating the configuration of remote servers using Ansible. It covers SSH key management, creating inventories, verifying connectivity, and deploying a web server (Nginx) with custom content—all using Ansible best practices.

### Core Concepts and Objectives

- Inventory: It lists your managed hosts (like webservers and databases) and specifies connection variables such as the username and the SSH key file to use. This file tells Ansible where your target machines are and how to connect to them. It can be a simple text file (INI format), YAML, or dynamic (from a script or cloud plugin).
- Playbook: A YAML file that describes automation tasks in a structured way. Playbooks define “plays,” which map a group of hosts to tasks.
- Task: A single action to perform (e.g., install a package, start a service).Defined in playbooks, roles, or included files.
- Module: The unit of work in Ansible, like copy, apt, yum, service, etc. They are what actually perform the tasks on the target machines.
- Role: A way to organize playbooks and files into reusable components (like a “package” of automation). Each role has its own tasks, handlers, variables, files, templates, etc
- Variable: Values that can be used dynamically within playbooks, tasks, and templates. Set in many places: inventory, playbooks, roles, etc.
- Handler: Special tasks that run only when notified, usually for actions like restarting services after a config change.
- Template: Files (often Jinja2) that Ansible can fill in with variables before sending to the target machine.

-------
-------

### T4: Ansible Installation ([copypubkey.yaml](./copypubkey.yaml))

- Install and configure Ansible Automation Platform on control node.
- Create inventory of a managed node.
- Generate new key on control node.
- Transfer the public key into managed node using ssh-copy-id command. 
- Perform ad-hoc command (check disk space) to check functionality.

Note that `key: "{{ lookup('file', '~/.ssh/ivolvekey.pub') }}"` uses the lookup function to fetch data from outside the playbook, it has several plugins where each one retrieves information in a different way here we used `file` lookup plugin that reads the contents of a file from the control machine and returns the raw content of that file as a strings.

-------

### T5: Ansible playbook  for web server configuration ([installnginx.yaml](./installnginx.yaml))

- Write an Ansible playbook to automate the configuration of a web server. 
- Install Nginx.
- Customize the web page.
- Verify the configuration on managed node.

-------
-------

## Ansible Vault

### T7: [mysql_secured.yaml](./mysql_secured.yaml) automate the following tasks:

- Install MySQL.
- Create iVovle database.
- Create user with all privileges on iVolve DB.
- Use Ansible Vault to encrypt sensitive information such as database user password
- Validate DB on managed node by connect to database using the created user and listing databases.

---

#### Main Commands for the vault
```
ansible-vault create vars.yaml
```


Note that by default, MySQL on Ubuntu is set up so root can only log in with the Linux socket (using sudo), not with a password as it doesn't accept the password for root because it's expecting a different type of login you'll get an access denied error.  
  
To solve this we have two options:
    
1- Usually there will be a working database so we enter mysql and change the root password by the follwoing command  
```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'rootpassword';
FLUSH PRIVILEGES;

```
2- add `login_unix_socket: /var/run/mysqld/mysqld.sock` which means connection to mysql using the local socket file instead of the password. Note that the socket file exists on the managed node. Not on your control/master node.

-------
-------

## Dynamic inventory 

### T7: Dynamic inventory that have EC2 instance

We'll use:
- plugin: aws_ec2
- you specify region and apply filters in the inventory
- must install boto3 in your local machine
- first, create aws IAM user with access key and secret access key, then set the credentials by running aws configure (must install awscli first) or by creating the file in ~/.aws/credentials
- create EC2 with tag name:ivolve , then make sure you can ssh from your local machine to the ec2 before run the playbook
- make sure ec2 has python installed on it
 

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
