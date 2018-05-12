# == Class: rbaselines::linux::hosts_localhost
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
#  class { 'rrbaselines::linux::hosts_localhost': }
#
# === Authors
#
# Andre Ramoni
#
class rbaselines::linux::hosts_localhost (
  $hosts_file = $::rbaselines::params::hosts_file,
) inherits rbaselines::params {
  host { 'hosts_localhost':
    ensure       => present,
    name         => $::fqdn,
    host_aliases => $::hostname,
    ip           => $::ipaddress,
    target       => $hosts_file,
  }
}
