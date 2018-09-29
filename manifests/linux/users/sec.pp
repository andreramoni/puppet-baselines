# == Class: rbaselines::linux::users::sec
#
# Manage root password.
# Parameters designed to be overrided on foreman
#
class rbaselines::linux::users::sec (
  $sec_password = $::rbaselines::params::sec_password,
) inherits rbaselines::params {
  require rbaselines::check_linux
    user { 'sec':
      ensure             => 'present',
      comment            => 'sec',
      gid                => 0,
      uid                => 0,
      home               => '/root',
      password           => "${sec_password}",
      password_max_age   => 99999,
      password_min_age   => 0,
      password_warn_days => 7,
      shell              => '/bin/bash',
    }
}
