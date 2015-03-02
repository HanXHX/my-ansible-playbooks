MongoDB role
============

Actions
-------

- Install [MongoDB](http://www.mongodb.org)
- Manages databases and users

Variables
---------

- mongodb\_source: where to install MongoDB (debian or official)
- mongodb\_conf: configuration as key/value
- mongodb\_users: same as module (see [Ansible doc](http://docs.ansible.com/mongodb_user_module.html))

Example:
```
mongodb_users:
  - name: 'foo'
    database: 'bar'
    password: 'admin1234'
    roles: 'readWrite'
```

NOTE
----

- You MUST create an admin user before activate auth!


TODO
----

- Manage replication
- Manage Debian backports

