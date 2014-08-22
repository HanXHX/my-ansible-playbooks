PHP role
========

Action
------
- Install and Configure:
  - PHP 
  - PHP-FPM
  - APC(u)
  - And many other extensions...

Variables
---------  

### IMPORTANT
- You must php\_\*\_sockets as global variables if you want to use PHP and Nginx on the same host.
- If you want to use PHP with Nginx, you must provide argument `php_fpm_tcp_sockets: 'unix'` or `php_fpm_tcp_sockets: tcp` as role argument.

### APCu
Look in roles/php/defaults/main.yml

### PHP
	php_timezone: 'Europe/Paris'
	php_display_errors: 'On'
	php_display_startup_errors: 'On'
	php_error_reporting: 'E_ALL'

### PHP-FPM Pools
Careful: `php_fpm_tcp_sockets` is not ready!

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
	    group: '{{ ansible_default_ipv4.address }}'
	    ip: '1.1.1.1'
	    port: 9000
	    pm_max_children: 250
	    pm_start_servers: 10
	    pm_min_spare_servers: 10
	    pm_max_spare_servers: 20
	
