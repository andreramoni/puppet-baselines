# == Class: rbaselines::linux::packages
#
# Installs and unninstalls basic software.
#
# === Parameters
#
# [*packages_to_install*]
#   Hash of packages to install.
#
# [*packages_to_remove*]
#   Hash of packages to remove.
#
# === Examples
#
#  class { 'rbaselines::linux::packages': }
#
# === Authors
#
# Andre Ramoni
#

class rbaselines::linux::packages (
  $packages_to_install = $::rbaselines::params::packages_to_install,
  $packages_to_remove  = $::rbaselines::params::packages_to_remove,
) inherits rbaselines::params {
  if $packages_to_install != '' {
    package { $packages_to_install: ensure => 'installed' }
  }
  if $packages_to_remove  != '' {
    package { $packages_to_remove: ensure => 'absent' }
  }
}
