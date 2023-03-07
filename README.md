# Webarchitects PHP Ansible role

This Ansible role is designed to install and configure PHP on Debian, by default it installes packages from [deb.sury.org](https://deb.sury.org/), but it can also be used to install and cpnfigure only PHP packages from Debian.

## Role variables

See the [defaults/main.yml](defaults/main.yml) file for the default variables, the [vars/main.yml](vars/main.yml) file for the preset variables and the [meta/argument_specs.yml](meta/argument_specs.yml) file for the variable specification.

## Help

Reinstall a package and the configuration files when they have been deleted (see [serverfault comment](https://serverfault.com/a/670776)):

```bash
UCF_FORCE_CONFFMISS=1  apt-get -o Dpkg::Options::="–force-confmiss" install "php8.1-fpm"
```

## Repository

The primary URL of this repo is [`https://git.coop/webarch/php`](https://git.coop/webarch/php) however it is also [mirrored to GitHub](https://github.com/webarch-coop/ansible-role-php) and [available via Ansible Galaxy](https://galaxy.ansible.com/chriscroome/php).

If you use this role please use a tagged release, see [the release notes](https://git.coop/webarch/php/-/releases).

In June 2021 this role was renamed from `phpfpm` to `php` and the URL of the git repo was updated to match, at the same time the git repo that was at `https://git.coop/webarch/php` was archived to [git.coop/webarch/php7](https://git.coop/webarch/php7).

## Copyright

Copyright 2019-2023 Chris Croome, &lt;[chris@webarchitects.co.uk](mailto:chris@webarchitects.co.uk)&gt;.

This role is released under [the same terms as Ansible itself](https://github.com/ansible/ansible/blob/devel/COPYING), the [GNU GPLv3](LICENSE).
