#!/bin/bash

BACKUP_DIR="/home/ubuntu/dailyBackups"
LOG_FILE="$BACKUP_DIR/cron.log"
DATE=$(date +%F)
BACKUP_FILE="$BACKUP_DIR/MySQL_backup_${DATE}.sql"

{    
	mysqldump --defaults-file=/home/ubuntu/.myconfigure.cnf --all-databases > "$BACKUP_FILE"
    
	if [ $? -eq 0 ]; then
        echo "Backup succeeded"
    else
        echo "Backup failed"
    fi
    
	echo "Backup Ended"

} >> "$LOG_FILE" 2>&1
