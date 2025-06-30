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
- Ansible galaxy: a community platform where people can share, find, and download reusable roles

-------

### T4: Ansible Installation

- Install and configure Ansible Automation Platform on control node.
- Create inventory of managed nodes.
- Generate new key on control node.
- Transfer the public key into managed node by ssh-copy-id command or by a playbook. 
- Perform ad-hoc command (check disk space) to check functionality.

-------

### T5: Ansible playbook  for web server configuration

- Write an Ansible playbook to automate the configuration of a web server. 
- Install Nginx.
- Customize the web page.
- Verify the configuration on managed node.

-------

## Ansible Vault

### T7: Automate the following tasks:

- Install MySQL.
- Create iVovle database.
- Create user with all privileges on iVolve DB.
- Use Ansible Vault to encrypt sensitive information such as database user password
- Validate DB on managed node by connect to database using the created user and listing databases.

----

## Dynamic inventory 

### T8: Dynamic inventory that have EC2 instance

We'll use:
- plugin: aws_ec2
- you specify region and apply filters in the inventory
- must install boto3 in your local machine
- first, create aws IAM user with access key and secret access key, then set the credentials by running aws configure (must install awscli first) or by creating the file in ~/.aws/credentials
- create EC2 with tag name:ivolve , then make sure you can ssh from your local machine to the ec2 before run the playbook
- make sure ec2 has python installed on it