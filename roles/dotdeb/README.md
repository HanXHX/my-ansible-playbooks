Dotdeb Role
===========

Actions
-------
- Configure APT to use [Dotdeb](http://www.dotdeb.org) repository


Variables
---------
- dotdeb\_php\_version: specify PHP version (works only with 5.5 or 5.6 and Debian Wheezy)
- dotdeb\_apt\_host: FQDN of Dotdeb default repository


Notes
-----
- [Debian 8.0 Jessie has been released, and what it means for Dotdeb](https://www.dotdeb.org/2015/04/26/debian-8-0-jessie-has-been-released-and-what-it-means-for-dotdeb/)
- Provide 3 versions of PHP (only for Debian Wheezy): 5.4, 5.5, 5.6
- If dotdeb\_php\_version is undefined, PHP version is 5.4
