Mysql role
==========

Actions
-------

- Install minimal packages
- Install [MariaDB](https://mariadb.org) or [MySQL](http://www.mysql.com) or [Percona Server](http://www.percona.com/software/percona-server)
- Configuration
- Secure your service

Variables
---------

- mysql\_server: 'mariadb' or 'mysql' or 'percona' (mariadb is default)
- mysql\_root\_password: default password used when installing database service
- mysql_cnf: key/value hash see [defaults/main.yml](default vars file)

### MariaDB

- mariadb\_version (5.5, 10.0, 10.1)
- mariadb\_repository (see: [http://mariadb.org/mariadb/repositories/](MariaDB repositories tool))

### Percona

- percona\_version (5.5, 5.6)
- percona\_repository (see: [http://www.percona.com/doc/percona-server/5.5/installation/apt_repo.html](Percona APT doc))

Notes
-----

- NEVER (yes NEVER), change your mysql\_server! This role don't manage migrations/upgrades/downgrades.
- Be careful! If you use 'mysql' you can have 2 versions: 5.5 (from Debian repository) and 5.6 from [Dotdeb](https://www.dotdeb.org)


TODO
----

- Test "official" releases of MySQL [http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/](http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/)
- Manage Galera and other tools
