# == Class: baselines::ssh_server
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
#  class { 'baselines::ssh_server': }
#
# === Authors
#
# Andre Ramoni
#

class baselines::ssh_server (
  $sshd_service         = $::baselines::params::sshd_service,
  $sshd_permitrootlogin = $::baselines::params::sshd_permitrootlogin,
  $sshd_x11forwarding   = $::baselines::params::sshd_x11forwarding,
  $sshd_usedns          = $::baselines::params::sshd_usedns,
  $sshd_printmotd       = $::baselines::params::sshd_printmotd,
  $sshd_printlastlog    = $::baselines::params::sshd_printlastlog,
) inherits baselines::params {

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
