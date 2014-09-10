PHP Phalcon Role
================

Actions
-------
- Download sources
- ./configure && make
- Checkinstall (override "make install" to creates a dirty deb package)

Variables
---------
- phalcon\_version: with version you need :)
- phalcon\_url: url fof package source (you should not override this var)
- phalcon\_root\_dir: directory where you download sources (you should not override this var)
- phalcon\_build\_dir: directory where you compile (you should not override this var)

Notes
-----
- This is a quick & dirty way to install Phalcon (checkinstall)
- We can't use Fortrabbit repository (only with PHP 5.4)
