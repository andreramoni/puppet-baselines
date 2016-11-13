# == Class: baselines::sysctl
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

class baselines::sysctl (
  $sysctl_options = $::baselines::params::sysctl_options,
) inherits baselines::params {

  augeas { 'sysctl':
      context => '/files/etc/sysctl.conf',
      changes => $sysctl_options,
      notify  => Exec['sysctl'],
  }

  exec { 'sysctl':
    command     => '/sbin/sysctl -p',
    refreshonly => true,
  }

}
