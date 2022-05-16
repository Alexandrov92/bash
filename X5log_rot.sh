#!/bin/bash

DB_USER='testuser';
DB_PASS='testpass';
DB_NAME='testdb';
TABLE='loginfo';

mkdir /home/alex/services/$(date +"%Y") . 2>/dev/null
cd /home/alex/services/$(date +"%Y") 
mkdir $(date +"%Y-%m") . 2>/dev/null
cd /home/alex/services/$(date +"%Y")/$(date +"%Y-%m")
tar cfj apache.log.$(date +"%Y-%m-%d").bz2 /home/alex/services/apache/apache.log . 2>/dev/null
#rm /home/alex/services/apache/apache.log
mysql --user=$DB_USER --password=$DB_PASS $DB_NAME << EOF
INSERT INTO $TABLE (data, path) VALUES ("$(date +"%Y-%m-%d")", "/home/alex/services/$(date +"%Y")/$(date +"%Y-%m")/apache.log.$(date +"%Y-%m-%d").bz2");
EOF

