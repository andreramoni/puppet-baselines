# == Class: rbaselines::linux::sshd
#
# Basic tunning of SSHd.
#
# === Parameters
#
# [*sshd_options*]
#   Hash of SSHd options.
#
# === Examples
#
#  class { 'rbaselines::linux::sshd': }
#
# === Authors
#
# Andre Ramoni
#

class rbaselines::linux::sshd (
  $sshd_service         = $::rbaselines::params::sshd_service,
  $sshd_permitrootlogin = $::rbaselines::params::sshd_permitrootlogin,
  $sshd_x11forwarding   = $::rbaselines::params::sshd_x11forwarding,
  $sshd_usedns          = $::rbaselines::params::sshd_usedns,
  $sshd_printmotd       = $::rbaselines::params::sshd_printmotd,
  $sshd_printlastlog    = $::rbaselines::params::sshd_printlastlog,
) inherits rbaselines::params {

  augeas { 'sshd_config':
      context => '/files/etc/ssh/sshd_config',
      changes => [
        "set PermitRootLogin ${sshd_permitrootlogin}",
        "set X11Forwarding ${sshd_x11forwarding}",
        "set UseDNS ${sshd_usedns}",
        "set PrintMotd ${sshd_printmotd}",
        "set PrintLastLog ${sshd_printlastlog}",
      ],
      notify  => Service[$sshd_service],
  }

  service { $sshd_service:
    ensure => running,
    enable => true,
  }

}
