my-ansible-playbooks
====================

About
-----
This playbook works with: Ansible 1.7.1 and Vagrant 1.6.3
The goal of this project is to create the "perfect" environement for PHP on Debian GNU/Linux.

Available roles
---------------

### Systems 

- [Minimal](roles/minimal)
- [Dotdeb](roles/dotdeb)
- [Security](roles/security)

### HTTP

- [Nginx](roles/nginx)
- [SSL Autosign](roles/ssl_autosign) (created autosign cert/key)

### PHP

- [PHP](roles/php) (PHP + PHP-FPM)
- [PHP Xdebug](roles/php-xdebug)
- [PHP Newrelic](roles/php-newrelic)
- [Phalcon framework](roles/php-phalcon)


### Databases

- [MySQL](roles/mysql)
- [MariaDB](roles/mariadb)
- [Redis](roles/redis)
- [RethinkDB](roles/rethinkdb)

### Backup 

- [BackupPC Server](roles/backuppc)
- [BackupPC host](roles/backuppc_host) (backupped)

### Misc

- [Jenkins](roles/jenkins)
- [MTA](roles/mta) (Postfix + OpenDKIM)
- [Newrelic](roles/newrelic_common)



TODO List
---------

- Manage MySQL versions: on debian wheezy repository => 5.5, on dotdeb => 5.6
- Create MySQL users/databases... Find any tip to create table?
- Split security role (should by a 'metarole') on many roles: firewall, fail2ban... etc
- Create standard users (with sudo)
- PHP-FPM socket = tcp
- Better "save" management in redis. Use a loop instead of using save, save2, save3...


Ideas for future
----------------

- Dedicated host per service with config generated (example for MySQL: innodb\_buffer\_pool = 75% available RAM)
- Configure firewall per service used (tcp/3306 if mysql is installed)
- Try [IRC module](http://docs.ansible.com/irc_module.html) (for fun only)
- Try Vagrant with many hosts (example: DB1 Master, DB2 Slave, Nginx proxy-cache, Nginx+PHP/FPM)
- Manage Debian Jessie (current testing). For example: Jessie doesn't have yet Dotdeb and Backport repository. Create 2 branches?
- IPv6 management (works with Vagrant/Virtualbox?)
- Better bashrc/vimrc
- Better management of OpenSSH
- Auto install and configure Wordpress :)
- Syslog to...? :)
- Monitoring (Nagios or Shinken)
- Nginx:
  - No-www redirect to www...
  - Reverse proxy cache
  - Have fun with [ngx\_pagespeed](https://github.com/pagespeed/ngx_pagespeed) (available in Dotdeb: nginx-full... find any others place)
- MySQL:
  - Manage replication
- Services:
  - PostgreSQL
  - [Redis Sentinel](http://redis.io/topics/sentinel) (Redis 2.8 available at Dotdeb and Backports)
  - [Redis Cluster](http://redis.io/topics/cluster-tutorial) (Redis 3.x still in beta)
  - [Elasticsearch](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/setup-repositories.html)
  - [Gitlab](https://about.gitlab.com/downloads/)
- Web interfaces:
  - [Wordpress](https://wordpress.org/)
  - [PHPMyAdmin](http://www.phpmyadmin.net)
  - [PHPRedmin](https://github.com/sasanrose/phpredmin)
- PHP:
  - zmq
  - [phpredis](https://github.com/nicolasff/phpredis) (Debian Package only available on Debian Jessie/Sid or Dotdeb) + feature: Session management in Redis
- Support [FreeBSD](http://www.freebsd.org)!
- Support [Devuan](https://www.devuan.org)
- Use Docker instead of Virtualbox

Notes
-----

- Apache will never be supported. I really hate this program... It was the better... Now Nginx is the better. You want Apache? Fork my fuckin project!
- All pull-requests are welcomed :)
- I hate systemd!
