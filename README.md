my-ansible-playbooks
====================

About
-----
This playbook works with: Ansible 1.6.10 and Vagrant 1.6.3
The goal of this project is to create the "perfect" environement for PHP on Debian GNU/Linux.

Ideas for future
----------------

- Configure sysctl
- Dedicated host per service with config generated (example for MySQL: innodb_buffer_pool = 75% available RAM)
- Configure firewall per service used (tcp/3306 if mysql is installed)
- Try [IRC module](http://docs.ansible.com/irc_module.html) (for fun only)
- Try Vagrant with many hosts (example: DB1 Master, DB2 Slave, Nginx proxy-cache, Nginx+PHP/FPM)
- Manage Debian Jessie (current testing). For example: Jessie doesn't have yet Dotdeb and Backport repository. Create 2 branches?
- IPv6 management (works with Vagrant/Virtualbox?)
- Better bashrc/vimrc
- Create standard users (with sudo)
- Better management of OpenSSH
- Auto install and configure Wordpress :)
- Syslog to...? :)
- Monitoring (Nagios or Shinken)
- Nginx:
  - Vhost management
  - SSL/TLS management
  - No-www redirect to www...
  - Reverse proxy cache
  - Have fun with [ngx_pagespeed](https://github.com/pagespeed/ngx_pagespeed) (available in Dotdeb: nginx-full... find any others place)
- MySQL:
  - Create user/databases
  - Manage replication
- Services:
  - PostgreSQL
  - [Redis Sentinel](http://redis.io/topics/sentinel) (Redis 2.8 available at Dotdeb and Backports)
  - [Redis Cluster](http://redis.io/topics/cluster-tutorial) (Redis 3.x still in beta)
  - [Elasticsearch](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/setup-repositories.html)
  - Postfix
  - [Jenkins](http://pkg.jenkins-ci.org/debian/) with [Jenkins-PHP](http://jenkins-php.org/)
  - [Gitlab](https://about.gitlab.com/downloads/)
- Web interfaces:
  - [Wordpress](https://wordpress.org/)
  - [PHPMyAdmin](http://www.phpmyadmin.net)
  - [PHPRedmin](https://github.com/sasanrose/phpredmin)
- PHP:
  - zmq
  - geoip
  - [Composer](http://getcomposer.org)
  - [Phalcon](http://phalconphp.com/)
  - [phpredis](https://github.com/nicolasff/phpredis) (Debian Package only available on Debian Jessie/Sid) + feature: Session management in Redis
- Support FreeBSD!

Notes
-----

- Apache will never be supported. I really hate this program... It was the better... Now Nginx is the better. You want Apache? Fork my fuckin project!
- All pull-requests are welcomed :)

