# == Class: rbaselines::linux::scripts
#
# A class to upload common scripts to your servers
#
# === Parameters
#
# [*scripts_dir*]
#
#
# === Examples
#
#  class { 'rbaselines::linux::scripts': }
#
# === Authors
#
# Andre Ramoni
#

class rbaselines::linux::scripts (
    $scripts_dir = $::rbaselines::params::scripts_dir,
) {
  file { $scripts_dir:
    ensure  => 'directory',
    source  => 'puppet:///modules/rbaselines/scripts',
    recurse => true,
  }
}
