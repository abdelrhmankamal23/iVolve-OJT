## Shell Scripting 

### T1: Shell Scripting Basics

1- Install MySQL database.

```
sudo apt install mysql-server -y
sudo systemctl enable mysqld
sudo systemctl status mysqld
```
2- Create new directory to store the backup.
```
mkdir dailyBackups
```

3- Create a shell script that takes backup from MySQL database (mysql dump), and store backup in the backup directory with name  MySQL_backup_{date}.sql

First we create aconfiguration file `/home/ubuntu/.myconfigure.cnf` that will have the database credentials and make its access permission 600
```
[client]
user=root
password=password
```
Note in `if [ $? -eq 0 ]` the special variable $? holds the exit status of the very last command executed, exit status of 0 means “success,” while any non-zero value indicates an error or failure  

4- Set a cron job using crontab to execute the script every day at 4:30 PM.
```
30 16 * * * /home/ubuntu/mysql_backup.sh >> /home/ubuntu/cron.log 2>&1
```