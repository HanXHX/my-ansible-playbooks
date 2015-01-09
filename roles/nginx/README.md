Nginx Role
==========

Actions
-------
- Install and configure Nginx
- Create folders and vhost for each sites
- Configure FastCGI to PHP (mandatory)

Variables
---------

You should see [defaults/main.yml](defaults/main.yml) ;)

### Global

- nginx\_apt\_package : (nginx, nginx-extras, nginx-full, nginx-light, nginx-naxsi)
- nginx\_root : root folder to create each sites
- nginx\_dir: logs directory
- nginx\_resolver: (hash)
  - hosts: list of DNS server (defaults are [OpenDNS](www.opendns.org))
  - valid
  - timeout

### Upstream

- nginx\_upstream (hash): each key have a bool 

### Nginx configuration

TODO

### Nginx events

TODO

### Nginx HTTP

Works as key/value.

### Vhost Management

Create each vhosts and sites: 

    nginx_websites:
      - name: 'mysite1'
        template: 'standard'
        listen: '80'                                                                                                                      
        server_name:
          - 'mysite1.com'
          - 'mysite1.net'
        ssl:
          use: false
          generatekey: true
          template: 'strong' # or legacy
        use_access_log: false
        use_error_log: false
        use_php: true
        use_pagespeed: false
        redirect:
          server_name:
            - 'www.mysite1.com'
            - 'www.mysite1.net'

/bin/bash: q : commande introuvable
- template: which template should we use for this vhost. See [here](templates/etc/nginx/sites-available/).
- listen: default port...
- server\_name: vhost hostnames (array)
- ssl:
  - use: should we configure SSL?
  - generatekey: should we use an autosign cert?
  - template: according with [https://cipherli.st/](https://cipherli.st/), i can provide "legacy" or "strong" cipher
- redirect: used to redirect hosts (www to no-www or no-ww to www)... I redirect to the first element in server\_name 
  - server\_name: array of hosts to redirect to main vhost


Notes
-----
- Available in default repository, Dotdeb and Backports
- ngx\_pagespeed (nginx-full) is not available in default repository
- SSL is not ready yet
