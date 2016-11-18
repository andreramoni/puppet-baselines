# This a class AND a defined type
# == Class: baselines::sysctl
# Basic tunning of sysctl.
#
# === Parameters
# [*sysctl_options*]
#   Hash of sysctl options.
#
# === Examples
# include baselines::sysctl # will take options from params.pp
#
# class { 'baselines::sysctl':
#   sysctl_options => [ 'set kernel.panic 3', ],
# }
#
# == Type: baselines::sysctl_options
# Custom tunning of sysctl options by profile/role.
#
# === Parameters
# [*sysctl_options*]
#   Hash of sysctl options.
#
# === Examples
# baselines::sysctl_options { 'firewall':
#   sysctl_options => [ 'set net.ipv4.ip_forward 1', ],
# }
#
# === Authors
#
# Andre Ramoni
#
class baselines::sysctl (
  $sysctl_options        = $::baselines::params::sysctl_options,
  $sysctl_reload_command = $::baselines::params::sysctl_reload_command,
  $sysctl_augeas_context = $::baselines::params::sysctl_augeas_context,
) inherits baselines::params {
  baselines::sysctl_options { 'baselines':
    sysctl_options        => $sysctl_options,
    sysctl_reload_command => $sysctl_reload_command,
    sysctl_augeas_context => $sysctl_augeas_context,
  }
}

define baselines::sysctl_options (
  $sysctl_options,
) {
  augeas { "sysctl_${title}":
    context => $sysctl_augeas_context,
    changes => $sysctl_options,
    notify  => Exec["sysctl_${title}"],
  }
  exec { "sysctl_${title}":
    command     => $sysctl_reload_command,
    refreshonly => true,
  }
}
