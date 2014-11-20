Nginx Role
==========

Actions
-------
- Install and configure Nginx
- Create folders and vhost for each sites
- Configure FastCGI to PHP (mandatory)

Variables
---------
- nginx\_apt\_package : (nginx, nginx-extras, nginx-full, nginx-light, nginx-naxsi)
- nginx\_root : root folder to create each sites

### Create each vhosts and sites: 
	websites:
	  - name: 'mysite1.com'
	    server_name: 'www.mysite1.com'
	    use_php: true
	    use_pagespeed: false
	    vhost: 'standard'
	    redirect_3O1_from:
	      - 'mysite1.com'
	      - 'new.mysite1.com'

### Manage FastCGI -> PHP-FPM

	php_fpm_unix_sockets:
	  - pool_name: 'yeah'
	    mode: '0660'
	    user: 'www-data'
	    group: 'www-data'
	    file: '/var/run/php5-fpm.sock'
	    pm_max_children: 250
	    pm_start_servers: 10
	    pm_min_spare_servers: 10
	    pm_max_spare_servers: 20
	
	php_fpm_tcp_sockets:
	  - pool_name: 'easytcp'
	    user: 'www-data'
	    group: 'www-data' 
	    ip: '{{ ansible_default_ipv4.address }}'
	    port: 9000
	    pm_max_children: 250
	    pm_start_servers: 10
	    pm_min_spare_servers: 10
	    pm_max_spare_servers: 20

This config is used by php role too.

Notes
-----
- Available in default repository, Dotdeb and Backports
