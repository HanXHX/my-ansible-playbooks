Dotdeb Role
===========

Actions
-------
- Configure APT to use [Dotdeb](http://www.dotdeb.org) repository


Variables
---------
- dotdeb\_php\_version: specify PHP version (works only with 5.5 or 5.6) 
- dotdeb\_apt\_host: FQDN of Dotdeb default repository


Notes
-----
- Provide 3 versions of PHP: 5.4, 5.5, 5.6
- If dotdeb\_php\_version is undefined, PHP version is 5.4
