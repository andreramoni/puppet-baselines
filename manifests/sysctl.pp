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
class baselines::sysctl (
  $sysctl_options = $::baselines::params::sysctl_options,
) inherits baselines::params {
  baselines::sysctl { 'baselines':
    sysctl_options => $sysctl_options,
  }
}

define baselines::sysctl_options (
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
