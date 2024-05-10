# Webarchitects PHP Ansible role

[![pipeline status](https://git.coop/webarch/php/badges/main/pipeline.svg)](https://git.coop/webarch/php/-/commits/main)

This Ansible role is designed to install and configure PHP on Debian, by default it installs PHP packaged by Ondřej Surý from [deb.sury.org](https://deb.sury.org/), but it can also be used to install and configure PHP packages from Debian.

This role is tested using `molecule` via [GitLab CI](.gitlab-ci.yml) on Debian Bookworm using [three molecule senarios](molecule/), firstly by installing and configuring the Debian Bookworm PHP CLI Server API (SAPI), secondly installing the Debian Bookworm FPM SAPI and finally installing the Ondřej Surý packages and enabling and starting PHP-FPM pools for PHP 7.4, 8.0, 8.1, 8.2 and 8.3.

This role enforces unique PHP-FPM pool names across all versions of PHP as this enables better monitoring, by default the `www` pools are renamed to `www82`, `www81` etc.

## Usage

The safe way to run this role is incrementally using `--diff -C` to diff and check what changes are to be made:

* Run with the `php_apt` tag to update the apt repo configuration, this supports check mode.
* Run with the `php_pkg` tag to update the packages, this doesn't support check mode.
* Run with the `php_cfg` tag to update the PHP configuration, this supports check mode.
* Run with the `php` tag to update everything.

This role supports having all the PHP settings in Ansible, to read existing config files and convert them into YAML you can do something like this:

```bash
cat /etc/php/8.2/fpm/php.ini | jc --ini -p | yq -o=yaml -P
```

This role can be used to remove config from CONF / INI files using `conf_absent` with `php_config` however it is probably better to template files with the congif required when there are variables to remove.

## Role variables

See the [defaults/main.yml](defaults/main.yml) file for the default variables, the [vars/main.yml](vars/main.yml) file for the preset variables and the [meta/argument_specs.yml](meta/argument_specs.yml) file for the variable specification.

This role has two required boolean variables, [php](#php) and [php_fpm_pool_check_fail](#php_fpm_pool_check_fail), two optional boolean variables, [php_check_legacy_variables](#php_check_legacy_variables), [php_sury](#php_sury) and [php_verify](#php_verify) and three optional lists, [php_config](#php_config), [php_modules](#php_modules) and [php_versions](#php_versions), the [VARIABLES.md](VARIABLES.md) file contains documentation generated from the [meta/argument_specs.yml](meta/argument_specs.yml) for all the variables including the internal ones.

### php

The `php` variable is required to be defined, by default it is `false`, when it is `true` all tasks in this role will be run.

### php_check_legacy_variables

The optional `php_check_legacy_variables` variable is `true` by default, this results in the role failing if any variables names from older versions of this role are defined, set it to `false` to skip these checks.

### php_config

The optional `php_config` list is used to specify the state of the PHP configuration, it enables the editing, generating and removal of PHP `.conf` and `.ini` files.

Each item in the list requires a `state`, which can be `absent` or `present` and a `version` which must be a string from this list of PHP versions:

```yaml
- "8.3"
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

The `edited` state can only be used for existing files, it enables the [Ansible ini module](https://docs.ansible.com/ansible/latest/collections/community/general/ini_file_module.html) to be used to edit configuration files without the need to template them, using a optional dictionary that is converted into a INI dictionary for the configuration to be present and a `conf_absent` optional dictionary that is converted into a INI dictionary for the configuration to be absent.

The `present` state will result in existing files being edited and not existing files to be templated.

The `templated` state can be used to generate new configuration files and to remove configuration through only specifing the configuration to be present.

File configuration is defined using a `conf` dictionary for `edited` and `templated` states and `conf_absent` for `edited` states.

An example `php_config` item:

```yaml
php_config:
  - name: PHP 8.3 configuration
    version: "8.3"
    state: present
    files:
      - name: PHP 8.3 FPM configuration
        path: /etc/php/8.3/fpm/php.ini
        state: edited
        conf:
          apc:
            "apc.enabled": "1"
          Date:
            "date.timezone": "Europe/London"
```

### php_fpm_pool_check_fail

The compulsory `php_fpm_pool_check_fail` variable defaults to `true`, set it to `false` to allw this role to run when duplicate PHP-FPM pool names are found on the server, once this role has updated the poool names to ensure that are unique it can be set back to `true`.

### php_modules

The optional `php_modules` list can be used to enable and disable PHP modules using `phpmyquery`, which adds and removes symlinks in the `apache2/conf.d`, `cli/conf.d` and `fpm/conf.d` directories which point to `.ini` files in the `mods-available` directory for each version of PHP.

Each item in the list requires a `state`, which can be `absent` or `present` and a `version` which must be a string from this list of PHP versions:

```yaml
- "8.3"
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

Plus a lists of `sapis`, each item of which requires an `sapi`, which can be one of `apache2`, `cli` or `fpm` and an optional `mods_enabled` and `mods_disabled` list.

For example:

```yaml
php_modules:
  - name: PHP 8.3 modules
  ⦙ version: "8.3"
  ⦙ state: present
  ⦙ sapis:
  ⦙ ⦙ - name: PHP 8.3 CLI modules
  ⦙ ⦙ ⦙ sapi: cli
  ⦙ ⦙ ⦙ mods_enabled:
  ⦙ ⦙ ⦙ ⦙ - apcu
  ⦙ ⦙ ⦙ ⦙ - mysqli
```

### php_sury

The optional `php_sury` variable is `true` by default which results in the [Debian PHP repo](https://packages.sury.org/php/) provided by Ondřej Surý being enabled for installing `.deb` packages. When `php_sury` is `false` the Ondřej Surý repo configuration is removed if present.

### php_verify

The optional `php_verify` variable is `true` by default which results in all variables that start with `php_` being checked using the [meta/argument_specs.yml](meta/argument_specs.yml), this is a stricter check than Ansible uses by default as non-defined variables, such as `php_foo` cause the verification to fail.

### php_versions

The optional `php_versions` list is used to install and remove PHP packages, each item in the list requires a `state`, which can be `absent` or `present` and a `version` which must be a string from this list of PHP versions:

```yaml
- "8.3"
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

An example `php_versions` item:

```yaml
php_versions:
  - name: PHP 8.3 packages
    version: "8.3"
    state: present
    pkg_absent:
      - libapache2-mod-php8.3
    pkg_present:
      - php8.3-apcu
```

## Help

Reinstall a package and the configuration files when they have been deleted (see [serverfault comment](https://serverfault.com/a/670776)):

```bash
UCF_FORCE_CONFFMISS=1 apt-get -o Dpkg::Options::="--force-confmiss" install --reinstall "php8.1-fpm"
```

## Repository

The primary URL of this repo is [`https://git.coop/webarch/php`](https://git.coop/webarch/php) however it is also [mirrored to GitHub](https://github.com/webarch-coop/ansible-role-php) and [available via Ansible Galaxy](https://galaxy.ansible.com/chriscroome/php).

If you use this role please use a tagged release, see [the release notes](https://git.coop/webarch/php/-/releases).

This repo had the `master` branch set to the default until June 2023, then the `sury` branch that was used to refactor the role to support the Debian packages built and provided by Ondřej Surý, was renamed to `main` and made the default.

In June 2021 this role was renamed from `phpfpm` to `php` and the URL of the git repo was updated to match, at the same time the git repo that was at `https://git.coop/webarch/php` was archived to [git.coop/webarch/php7](https://git.coop/webarch/php7).

## Copyright

Copyright 2019-2024 Chris Croome, &lt;[chris@webarchitects.co.uk](mailto:chris@webarchitects.co.uk)&gt;.

This role is released under [the same terms as Ansible itself](https://github.com/ansible/ansible/blob/devel/COPYING), the [GNU GPLv3](LICENSE).
