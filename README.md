# PHP-FPM

Ansible role for installing `php-fpm` from the distro repos for Debian Bullseye (PHP 7.4), Ubuntu Focal (PHP 7.4), Debian Buster (PHP 7.3), Ubuntu Bionic (PHP 7.2) and Debian Stretch (PHP 7.0).

See the [default variables](defaults/main.yml).

This role isn't setup to generate multiple `pool.d` config files, but the [users role is](https://git.coop/webarch/users/blob/master/templates/phpfpm_chroot_user.conf.j2).

Note that after upgrading from one Debian or Ubuntu version to another you will have to manually purge the packages from the old version of PHP.
