# PHP

Ansible role for installing `php-fpm` from the distro repos for Debian Bullseye (PHP 7.4), Ubuntu Focal (PHP 7.4), Debian Buster (PHP 7.3), Ubuntu Bionic (PHP 7.2) and Debian Stretch (PHP 7.0).

See the [default variables](defaults/main.yml).

This role isn't setup to generate multiple `pool.d` config files, but the [users role is](https://git.coop/webarch/users/blob/master/templates/phpfpm_chroot_user.conf.j2).

Note that after upgrading from one Debian or Ubuntu version to another you will have to manually purge the packages from the old version of PHP &mdash; this role is set to fail if `phpquery -V` returns more than one version of PHP.

In June 2021 this role was renamed from `phpfpm` to `php` and the URL of the git repo and all the variable names and tags have been updated to match, at the same time the git repo that was at `https://git.coop/webarch/php` was archived to [git.coop/webarch/php7](https://git.coop/webarch/php7).
