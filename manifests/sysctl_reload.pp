# == Class: baselines::sysctl_reload
#
# Basic tunning of sysctl.
#
# === Parameters
#
# [*sysctl_options*]
#   Hash of sysctl options.
#
# === Examples
#
#  class { 'baselines::sysctl': }
#
# === Authors
#
# Andre Ramoni
#

class baselines::sysctl_reload (
  $sysctl_reload_command = $::baselines::params::sysctl_reload_command,
) inherits baselines::params {
  exec { 'sysctl_reload':
    command     => $sysctl_reload_command,
    refreshonly => true,
  }

}
