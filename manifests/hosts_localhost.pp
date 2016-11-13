# == Class: baselines::hosts_localhost
#
# This class ensures a host entry in /etc/hosts.
# Debian seems to do it right, but CentOS not.
#
# === Variables
#
# [*hosts_file*]
#   File to change.
#
# === Examples
#
#  class { 'baselines::hosts_localhost': }
#
# === Authors
#
# Andre Ramoni
#
class baselines::hosts_localhost (
  $hosts_file = $::baselines::params::hosts_file,
) inherits baselines::params {
  host { 'hosts_localhost':
    ensure       => present,
    name         => $::fqdn,
    host_aliases => $::hostname,
    ip           => $::ipaddress,
    target       => $hosts_file,
  }
}
