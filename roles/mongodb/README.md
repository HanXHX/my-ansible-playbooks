MongoDB role
============

Actions
-------

- Install [MongoDB](http://www.mongodb.org)
- Create "ansible" user
- Manages databases and users

Variables
---------

- mongodb\_source: where to install MongoDB (debian or official)
- mongodb\_conf: configuration as key/value
- mongodb\_users: same as module (see [Ansible doc](http://docs.ansible.com/mongodb_user_module.html))
- mongo\_ansible\_password: administrative password to manage users

Example:
```
mongodb_users:
  - name: 'foo'
    database: 'bar'
    password: 'admin1234'
    roles: 'readWrite'
```

TODO
----

- Manage replication
- Manage Debian backports

