my-ansible-playbooks
====================

This project is abandoned. I let this files as "archive".

You can see my roles on [Ansible Galaxy](https://galaxy.ansible.com/HanXHX/).

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
- [Phalcon framework](roles/php-phalcon)(1)

### Databases

- [Elasticsearch](roles/elasticsearch)
- [MySQL / MariaDB / Percona Server](roles/mysql)(1)
- [MongoDB](roles/mongodb)
- [Redis](roles/redis)(1)
- [RethinkDB](roles/rethinkdb)

### Message Queues

- [Beanstalkd](roles/beanstalkd)

### Backup

- [BackupPC Server](roles/backuppc)(1)
- [BackupPC host](roles/backuppc_host) (backupped)

### Misc

- [aptly](roles/aptly)
- [Jenkins](roles/jenkins)(1)
- [MTA](roles/mta) (Postfix + OpenDKIM)
- [Newrelic](roles/newrelic_common)


(1) Role moved to a dedicated repository

