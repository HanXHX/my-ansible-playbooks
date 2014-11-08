MTA role
========

Actions
-------

- Remove awful MTA (exim4...)
- Install and configure Postfix
- Install and configure OpenDKIM 
- Generate OpenDKIM keys
- Configure bounce management (perl script)

Variables
---------

- root\_email: redirect root email to another address. Default is false
- mtai\_domain: domain name used to send emails (mandatory)
- opendkim\_selector: default is dbi

Notes
-----

- 1 IP = 1 domain = 1 DKIM!
