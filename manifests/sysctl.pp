# == Type: baselines::sysctl
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
# baselines::sysctl {'firewall':
#   sysctl_options => [ 'net.ipv4.ip_forward']
# }
#
# === Authors
#
# Andre Ramoni
#

define baselines::sysctl (
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
