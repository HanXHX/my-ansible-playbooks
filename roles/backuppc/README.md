BackupPC role
=============

Actions
-------
- Install BackupPC
- Install tools to manage htpasswd
- Create vhost

Role dependencies
-----------------
- minimal
- nginx
- ssl\_autosign (if needed)

Mandatory vars
----

### Use this variables as group vars
- backuppc\_server\_name: fqdn for Nginx 
- backuppc\_use\_ssl: configure Nginx to use self signed configuration (yes/no)

### Host speicific
- backuppc\_users: list all users for htpassd (keys : user, pass)
 
