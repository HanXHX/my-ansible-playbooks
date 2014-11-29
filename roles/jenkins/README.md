Jenkins role
============

Actions
-------

- Install PHP tools
- Configure APT (key + repository)
- Install Jenkins
- Get CLI tools
- Update module list
- Install modules

Variables
---------

- jenkins\_dir: directory where you download tools (cli) and updates

Notes
-----

- Sometimes (first launch), you can have an error while getting cli tools (port 8080 opened but jenkins not fully running). Relaunch this role, it will fix it.
- No configuration for Jenkins... Later I'll add jenkins port, ip... etc. 
- Be careful! I force use Debian Jessie (testing). It can break your system (php packages).
- Based on this work: http://jenkins-php.org/installation.html (thank you) 
- TODO: i use php role as dependency... but it installs php-fpm!

