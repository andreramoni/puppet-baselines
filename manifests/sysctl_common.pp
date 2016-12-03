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
class rbaselines::sysctl_common (
  $sysctl_options        = $::rbaselines::params::sysctl_options,
) inherits rbaselines::params {
  rbaselines::sysctl { 'rbaselines':
    sysctl_options        => $sysctl_options,
  }
}
