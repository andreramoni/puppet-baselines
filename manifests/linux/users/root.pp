# == Class: rbaselines::linux::users::root
#
# Manage root password.
# Parameters designed to be overrided on foreman
#
class rbaselines::linux::users::root (
  $root_password = $::rbaselines::params::root_password,
  $manage_root   = $::rbaselines::params::manage_root,
) inherits rbaselines::params {
  require rbaselines::check_linux
  if $manage_root {
    user { 'root':
      ensure             => 'present',
      comment            => 'root',
      gid                => 0,
      home               => '/root',
      password           => "${root_password}",
      password_max_age   => 99999,
      password_min_age   => 0,
      password_warn_days => 7,
      shell              => '/bin/bash',
      uid                => 0,
    }
  }
}
