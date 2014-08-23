SSL\_Autosign Role
=================

Actions
-------
- Install OpenSSL
- Create self-signed certificate + key for Nginx in /etc/nginx/ssl/my.domain.tld.{crt,key}
- Secure SSL key (chown + chmod)


Variables
---------
- ssl\_domain: create files for this domain 

Notes
----
- Don't call this role. It is a "dependencie role". You can see backuppc role as exemple.
