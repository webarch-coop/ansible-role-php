# PHP-FPM

Ansible role for installing `php-fpm` on Debian Stretch and Debian Buster.

Variables:

```yml
phpfpm_disable_functions: pcntl_alarm,pcntl_fork,pcntl_waitpid,pcntl_wait,pcntl_wifexited,pcntl_wifstopped,pcntl_wifsignaled,pcntl_wifcontinued,pcntl_wexitstatus,pcntl_wtermsig,pcntl_wstopsig,pcntl_signal,pcntl_signal_get_handler,pcntl_signal_dispatch,pcntl_get_last_error,pcntl_strerror,pcntl_sigprocmask,pcntl_sigwaitinfo,pcntl_sigtimedwait,pcntl_exec,pcntl_getpriority,pcntl_setpriority,pcntl_async_signals,dl,exec,passthru,pcntl_exec,popen,proc_close,proc_get_status,proc_nice,proc_open,proc_terminate,shell_exec,show_source,symlink,system,system_exec,
phpfpm_max_execution_time: 180
phpfpm_max_input_vars: 10000
phpfpm_memory_limit: 256M
phpfpm_post_max_size: 256M
phpfpm_upload_max_filesize: 128M
phpfpm_max_file_uploads: 60
phpfpm_max_input_time: 180
phpfpm_allow_url_include:  On
phpfpm_opcache_enable: 1
phpfpm_opcache_memory_consumption: 1024
phpfpm_opcache_max_accelerated_files: 100000
phpfpm_packages:
  - bcmath
  - cli
  - curl
  - gd
  - geoip
  - imagick
  - imap
  - intl
  - json
  - mcrypt
  - mysqli
  - opcache
  - sqlite3
  - readline
  - uploadprogress
  - xmlrpc
```
