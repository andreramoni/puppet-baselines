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

define rbaselines::sysctl (
  $sysctl_options,
) {
  augeas { "sysctl_${title}":
    context => '/files/etc/sysctl.conf',
    changes => $sysctl_options,
    notify  => Exec["sysctl_${title}"],
  }
  exec { "sysctl_${title}":
    command     => '/sbin/sysctl -p',
    refreshonly => true,
  }
}
