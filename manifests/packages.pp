# == Class: baselines::packages
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
#  class { 'baselines::packages': }
#
# === Authors
#
# Andre Ramoni
#

class baselines::packages (
  $packages_to_install = $::baselines::params::packages_to_install,
  $packages_to_remove  = $::baselines::params::packages_to_remove,
) inherits baselines::params {
  if $packages_to_install != '' {
    package { $packages_to_install: ensure => 'installed' }
  }
  if $packages_to_remove  != '' {
    package { $packages_to_remove: ensure => 'absent' }
  }
}
