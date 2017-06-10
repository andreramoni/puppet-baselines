# == Class: rbaselines::scripts
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
#  class { 'rbaselines::scripts': }
#
# === Authors
#
# Andre Ramoni
#

class rbaselines::scripts (
    $scripts_dir = $::rbaselines::params::scripts_dir,
) {
  file { $scripts_dir:
    ensure  => 'directory',
    source  => 'puppet:///modules/rbaselines/scripts',
    recurse => true,
  }
}
