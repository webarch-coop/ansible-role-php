# Webarchitects PHP Ansible role

This role isn't setup to generate multiple `pool.d` config files, but the [users role is](https://git.coop/webarch/users/blob/master/templates/phpfpm_chroot_user.conf.j2).

<!-- BEGIN_ANSIBLE_DOCS -->

<!-- END_ANSIBLE_DOCS -->

## Help

Reinstall a package and the configuration files when they have been deleted (see [serverfault comment](https://serverfault.com/a/670776)):

```bash
UCF_FORCE_CONFFMISS=1  apt-get -o Dpkg::Options::="–force-confmiss" install "php8.1-fpm"
```


## Repo History

In June 2021 this role was renamed from `phpfpm` to `php` and the URL of the git repo and all the variable names and tags have been updated to match.

