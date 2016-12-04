# This a defined type
# == rbaselines::sysctl
# Basic tunning of sysctl.
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
