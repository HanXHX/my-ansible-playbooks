BackupPC host role
==================

Actions
-------

- Prepare host to be backupped/restored:
  - Download SSH key from backuppc@server
  - Install this key to root 
- Create new config in BackupPC server 

Variables
---------
- hostname: FQDN of current host (common with "minimal" role)
- backuppc\_server\_name: hostname (Vhost) of current BackupPC server (common with "backuppc" role)
