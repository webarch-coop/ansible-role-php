# Webarchitects PHP Ansible Role Variables

Documentation for all the variables, including internal ones which you do not need to set, follow, this documentation has been generated from the [meta/argument_specs.yml](meta/argument_specs.yml), see also the [README.md](README.md).

## Entrypoint: main

The main entry point for the PHP role.

|Option|Description|Type|Required|
|---|---|---|---|
| php | Run the tasks in this role. | bool | yes |
| php_ansible_managed | The ansible_managed string. | str | yes |
| php_check_legacy_variables | Check that legacy variables and not defined. | bool | no |
| php_conf_dirs_absent | A generated list of PHP configuration directories to remove if present. | list of 'str' | no |
| php_conf_dirs_present | A generated list of PHP configuration directories to create if absent. | list of 'str' | no |
| php_conf_files_absent | A generated list of PHP configuration files to remove if present. | list of 'str' | no |
| php_conf_files_edited | A generated list of PHP configuration files to edit if present. | list of 'str' | no |
| php_conf_files_present | A generated list of php configuration files to edit if present or template if absent. | list of 'str' | no |
| php_conf_files_not_absent | A generated list of php configuration files that are not absent. | list of 'str' | no |
| php_conf_files_templated | A generated list of php configuration files to template. | list of 'str' | no |
| php_conf_not_absent | A generated list of php configuration that is not absent. | list of 'str' | no |
| php_conf_pool_files_not_absent | A generated list of php pool files that are not absent. | list of 'str' | no |
| php_conf_ver_absent | a generated list of versions of php configuration to remove if present. | list of 'str' | no |
| php_conf_ver_present | a generated list of versions of php configuration that should be present. | list of 'str' | no |
| php_config | Optional PHP configuration. | list of dicts of 'php_config' options | no |
| php_debian_bullseye_pkg | A list of Debian Bullseye packages to install. | list of 'str' | no |
| php_debian_buster_pkg | A list of Debian Buster packages to install. | list of 'str' | no |
| php_debian_bookworm_pkg | A list of Debian Bookworm packages to install. | list of 'str' | no |
| php_conf_file_paths_jmespath_query | A internale JMESPath query string. | str | yes |
| php_file_path_separator | The file path seperator to use. | str | yes |
| php_fpm_package | Loop variables for a PHP-FPM package. | str | no |
| php_fpm_packages_present | A generated list of PHP-FPM packages present. | list of 'str' | no |
| php_fpm_pool_check_fail | Fail when duplicated PHP-FPM pool names are found. | bool | yes |
| php_fpm_pools | A generated list of FPM pool names and socket paths. | list of dicts of 'php_fpm_pools' options | no |
| php_fpm_version | Loop variables for a PHP-FPM version. | str | no |
| php_fpm_versions_present | A generated list of PHP-FPM versions present. | list of 'str' | no |
| php_gpg_checksum | The SHA256 checksum for packages.sury.org/php/apt.gpg. | str | yes |
| php_gpg_fingerprints | A list GPG fingerprints from packages.sury.org/php/apt.gpg. | list of 'str' | yes |
| php_gpg_url | The URL of the Sury GPG public key. | str | yes |
| php_mods_ver_absent | A generated list of PHP versions for which module configuration should be absent. | list of 'str' | no |
| php_mods_ver_present | A generated list of PHP versions for which module configuration should be present. | list of 'str' | no |
| php_modules | An optional list of PHP versions that require module configuration. | list of dicts of 'php_modules' options | no |
| php_pkg_absent | A generated list of PHP packages which should be absent. | list of 'str' | no |
| php_pkg_present | A generated list of PHP packages which should be present. | list of 'str' | no |
| php_pool_names_not_absent | A generated list of PHP-FPM pool names that are not absent. | list of 'str' | no |
| php_sury | Configure the Sury PHP deb package repo. | bool | no |
| php_ver | A PHP version loop variable, only used internally by this role. | str | no |
| php_ver_absent | A generated list of PHP versions which should be absent. | list of 'str' | no |
| php_ver_absent_regex | A pattern to use as a regular expression to find versions of PHP which should be absent. | str | yes |
| php_ver_pkg_remove | A generated list of PHP packages to remove. | list of 'str' | no |
| php_ver_present | A generated list of PHP versions which should be present. | list of 'str' | no |
| php_verify | Varify all variables starting with php underscore using the argument spec. | bool | no |
| php_versions | A list of PHP versions and their packages and state. | list of dicts of 'php_versions' options | no |

### Options for main > php_config

|Option|Description|Type|Required|
|---|---|---|---|
| files | A optional list of PHP file paths and their configuration. | list of dicts of 'files' options | no |
| name | A optional name for the PHP version configuration. | str | no |
| state | The state of the configuration files for the version of PHP. | str | yes |
| version | The PHP version number. | str | yes |### Options for main > php_config > files

|Option|Description|Type|Required|
|---|---|---|---|
| conf | A optional YAML dictionary representing the sections, variables and values of a PHP configuration file. | dict | no |
| name | A optional name for the PHP configuration file. | str | no |
| path | The path of the PHP configuration file. | str | yes |
| state | The state of the PHP configuration file. | str | yes |### Options for main > php_fpm_pools

|Option|Description|Type|Required|
|---|---|---|---|
| name | The PHP version. | str | yes |
| pools | A list of PHP-FPM pool socket paths for the PHP version. | list of 'str' | no |### Options for main > php_modules

|Option|Description|Type|Required|
|---|---|---|---|
| name | A optional name for the PHP modules version. | str | no |
| sapis | An optional list of PHP SAPIs. | list of dicts of 'sapis' options | no |
| state | The state of the PHP modules. | str | no |
| version | The PHP version number. | str | yes |### Options for main > php_modules > sapis

|Option|Description|Type|Required|
|---|---|---|---|
| mods_disabled | A list of PHP modules to be disabled for the specific SAPI and PHP version. | list of 'str' | no |
| mods_enabled | A list of PHP modules to be enabled for the specific SAPI and PHP version. | list of 'str' | no |
| name | A optional name for the PHP version SAPI modules. | str | no |
| sapi | The name of the SAPI to have modules configured. | str | yes |### Options for main > php_versions

|Option|Description|Type|Required|
|---|---|---|---|
| name | A optional name for the PHP version packages. | str | no |
| pkg_absent | Packages that should be absent for this PHP version. | list of 'str' | no |
| pkg_present | Packages that should be present for this PHP version. | list of 'str' | no |
| state | The state of the packages for the PHP version. | str | yes |
| version | The PHP version number. | str | yes |

### Choices for main > php_config > files > state

|Choice|
|---|
| absent |
| edited |
| present |
| templated |

### Choices for main > php_config > state

|Choice|
|---|
| absent |
| present |

### Choices for main > php_config > version

|Choice|
|---|
| 8.3 |
| 8.2 |
| 8.1 |
| 8.0 |
| 7.4 |
| 7.3 |
| 7.2 |
| 7.1 |
| 7.0 |
| 5.6 |

### Choices for main > php_file_path_separator

|Choice|
|---|
| / |

### Choices for main > php_modules > sapis > sapi

|Choice|
|---|
| apache2 |
| cli |
| fpm |

### Choices for main > php_modules > state

|Choice|
|---|
| absent |
| present |

### Choices for main > php_modules > version

|Choice|
|---|
| 8.3 |
| 8.2 |
| 8.1 |
| 8.0 |
| 7.4 |
| 7.3 |
| 7.2 |
| 7.1 |
| 7.0 |
| 5.6 |

### Choices for main > php_versions > state

|Choice|
|---|
| absent |
| present |

### Choices for main > php_versions > version

|Choice|
|---|
| 8.3 |
| 8.2 |
| 8.1 |
| 8.0 |
| 7.4 |
| 7.3 |
| 7.2 |
| 7.1 |
| 7.0 |
| 5.6 |
