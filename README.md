# Webarchitects PHP Ansible role

This Ansible role is designed to install and configure PHP on Debian, by default it installs packages from [deb.sury.org](https://deb.sury.org/), but it can also be used to install and cpnfigure only PHP packages from Debian.

## Role variables

See the [defaults/main.yml](defaults/main.yml) file for the default variables, the [vars/main.yml](vars/main.yml) file for the preset variables and the [meta/argument_specs.yml](meta/argument_specs.yml) file for the variable specification.

This roles has three boolean variables and two lists:

### php

By default `php` is `true`, when it is `false` all tasks in this role will be skipped.

### php_check_legacy_variables

By default `php_check_legacy_variables` is `true`, this results in the role failing if any variables names from older versions of this role are defined, set it to `false` to skip these checks.

### php_sury

By defauly `php_sury` is `true` which results in the [Debian PHP repo](https://packages.sury.org/php/) provided by Ondřej Surý being enabled for installing `.deb` packages. When `php_sury` is `false` the repo configuration is removed if present.

### php_config

The optional `php_config` list is used to specify the state of the PHP configuration, it enables the editing, generating and removal of PHP `.conf` and `.ini` files.

Each item in the list requires a `state`, which can be `absent` or `present` and a `version` which must be a string from this list of PHP versions:

```yaml
- "8.2"
- "8.1"
- "8.0"
- "7.4"
- "7.3"
- "7.2"
- "7.1"
- "7.0"
- "5.6"
```

Optional item variables are `name` and `files`, which is used to define the PHP version configuration state.

The `files` dictionary requires a `path` and `state` for each file, the state can be one of four options:

```yaml
- absent
- edited
- present
- templated
```

The `edited` state can only be used for existing files, it enables the [Ansible ini module](https://docs.ansible.com/ansible/latest/collections/community/general/ini_file_module.html) to be used to edit configuration files withoiyt the need to template them.

The `present` state will result in existing files being edited and not existing files to be templated.

The `templated` state can be used to generate new configuration files.

File configuration is defined using a `conf` dictionary.

### php_versions

The optional `php_versions` list is used to install and remove PHP packages, each item in the list requires a `state`, which can be `absent` or `present` and a `version` which must be a string from this list of PHP versions:

```yaml
- "8.2"
- "8.1"
- "8.0"
- "7.4"
- "7.3"
- "7.2"
- "7.1"
- "7.0"
- "5.6"
``` 

Two optional lists, `pkg_absent` and `pkg_present` are used to list `.deb` packages that are to be installed or removed.

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
