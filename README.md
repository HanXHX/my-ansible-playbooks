my-ansible-playbooks
====================

About
-----
This playbook works with: Ansible 1.7.1 and Vagrant 1.6.3
The goal of this project is to create the "perfect" environment for PHP on Debian GNU/Linux (Wheezy/Jessie).

Available roles
---------------

### Systems

- [Minimal](roles/minimal)(1)
- [Dotdeb](roles/dotdeb)(1)
- [ZFS](roles/zfs)
- [Docker](roles/docker)


### Security
- [Security](roles/security) (metarole)
- [Fail2ban](roles/fail2ban)

### HTTP

- [Nginx](roles/nginx)(1)
- [SSL Autosign](roles/ssl_autosign) (created autosign cert/key)

### PHP

- [PHP](roles/php)(1)
- [PHP Xdebug](roles/php-xdebug)(1)
- [PHP Newrelic](roles/php-newrelic)
- [Phalcon framework](roles/php-phalcon)

### Databases

- [Elasticsearch](roles/elasticsearch)
- [MySQL / MariaDB / Percona Server](roles/mysql)
- [MongoDB](roles/mongodb)
- [Redis](roles/redis)(1)
- [RethinkDB](roles/rethinkdb)

### Message Queues

- [Beanstalkd](roles/beanstalkd)

### Backup

- [BackupPC Server](roles/backuppc)
- [BackupPC host](roles/backuppc_host) (backupped)

### Misc

- [aptly](roles/aptly)
- [Jenkins](roles/jenkins)
- [MTA](roles/mta) (Postfix + OpenDKIM)
- [Newrelic](roles/newrelic_common)


(1) Role moved to a dedicated repository


TODO List
---------

- Better dotfiles :p
- Create standard users (with sudo)
- PHP-FPM socket = tcp
- Logrotate management (Nginx)


Ideas for future
----------------

- Configure firewall per service used (tcp/3306 if mysql is installed)
- Try [IRC module](http://docs.ansible.com/irc_module.html) (for fun only)
- Try Vagrant with many hosts (example: DB1 Master, DB2 Slave, Nginx proxy-cache, Nginx+PHP/FPM)
- IPv6 management (works with Vagrant/Virtualbox?)
- Better management of OpenSSH
- Auto install and configure Wordpress :)
- Syslog to...? :)
- Monitoring (Nagios or Shinken)
- Nginx:
  - Reverse proxy cache
  - Have fun with [ngx\_pagespeed](https://github.com/pagespeed/ngx_pagespeed) (available in Dotdeb: nginx-full... find any others place)
- MySQL:
  - Manage replication
- Services:
  - PostgreSQL
  - [Redis Sentinel](http://redis.io/topics/sentinel) (available in Dotdeb and Backports)
  - [Redis Cluster](http://redis.io/topics/cluster-tutorial) (Redis 3 available in Dotdeb)
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

Notes
-----

- Apache will never be supported. I really hate this program... It was the better... Now Nginx is the better. You want Apache? Fork my fuckin project!
- All pull-requests are welcomed :)
- I hate systemd!
