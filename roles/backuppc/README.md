BackupPC role
=============

Actions
-------
- Install BackupPC
- Install tools to manage htpasswd

Role dependencies
-----------------
- minimal
- nginx

Mandatory vars
----
- backuppc\_server\_name: fqdn for Nginx 
- backuppc\_users: list all users for htpassd (keys : user, pass)
 
