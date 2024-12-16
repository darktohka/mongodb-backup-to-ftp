#!/bin/bash
set -e

DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="/tmp/timecrew_backup_$DATE.archive"

echo "Starting MongoDB backup..."
mongodump --uri="$MONGODB_URI" --archive="$BACKUP_FILE"
echo "Backup completed: $BACKUP_FILE"

echo "Uploading the backup to a FTP server..."
ftp -inv $FTP_SERVER <<EOF
user $FTP_USERNAME $FTP_PASSWORD
put $BACKUP_FILE
bye
EOF

echo "Backup uploaded successfully."
rm -f $BACKUP_FILE
