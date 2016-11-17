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

define baselines::sysctl (
  $sysctl_options = [
    'set kernel.panic 3',
    'set vm.panic_on_oom 1',
  ],
) {

  augeas { "sysctl_${title}":
      context => '/files/etc/sysctl.conf',
      changes => $sysctl_options,
      notify  => Class['sysctl_reload'],
  }

}
