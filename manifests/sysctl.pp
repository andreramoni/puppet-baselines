# This a class AND a defined type
# == Class: rbaselines::sysctl
# Basic tunning of sysctl.
#
# === Parameters
# [*sysctl_options*]
#   Hash of sysctl options.
#
# === Examples
# include rbaselines::sysctl # will take options from params.pp
#
# class { 'rbaselines::sysctl':
#   sysctl_options => [ 'set kernel.panic 3', ],
# }
#
# == Type: rbaselines::sysctl_options
# Custom tunning of sysctl options by profile/role.
#
# === Parameters
# [*sysctl_options*]
#   Hash of sysctl options.
#
# === Examples
# rbaselines::sysctl_options { 'firewall':
#   sysctl_options => [ 'set net.ipv4.ip_forward 1', ],
# }
#
# === Authors
#
# Andre Ramoni
#
class rbaselines::sysctl (
  $sysctl_options        = $::rbaselines::params::sysctl_options,
  $sysctl_reload_command = $::rbaselines::params::sysctl_reload_command,
  $sysctl_augeas_context = $::rbaselines::params::sysctl_augeas_context,
) inherits rbaselines::params {
  rbaselines::sysctl_options { 'rbaselines':
    sysctl_options        => $sysctl_options,
    sysctl_reload_command => $sysctl_reload_command,
    sysctl_augeas_context => $sysctl_augeas_context,
  }
}

define rbaselines::sysctl_options (
  $sysctl_options,
  $sysctl_reload_command,
  $sysctl_augeas_context,
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
