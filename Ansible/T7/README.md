#### Main Commands for the vault
```
ansible-vault create vars.yaml
ansible-vault view vars.yaml
ansible-vault edit vars.yaml

```


Note that by default, MySQL on Ubuntu is set up so root can only log in with the Linux socket (using sudo), not with a password as it doesn't accept the password for root because it's expecting a different type of login you'll get an access denied error.  
  
To solve this we have two options:
1- add `login_unix_socket: /var/run/mysqld/mysqld.sock` which means connection to mysql using the local socket file instead of the password. Note that the socket file exists on the managed node. Not on your control/master node.    

2- Usually there will be a working database so we enter mysql and change the root password by the follwoing command  
```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'rootpassword';
FLUSH PRIVILEGES;
```