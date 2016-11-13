# == Class: baselines::scripts
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
#  class { 'baselines::scripts': }
#
# === Authors
#
# Andre Ramoni
#

class baselines::scripts (
    $scripts_dir = $::baselines::params::scripts_dir,
) {
  file { $scripts_dir:
    ensure  => 'directory',
    source  => 'puppet:///modules/baselines/scripts',
    recurse => true,
  }

}
