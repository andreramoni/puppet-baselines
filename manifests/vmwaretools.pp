# == Class: baselines::vmwaretools
#
# This class installs vmware tools package
# if the system is running on vmware.
#
# === Variables
#
# [*vmwaretools_package*]
#   Name of the package.
#
# === Examples
#
#  class { 'baselines::vmwaretools': }
#
# === Authors
#
# Andre Ramoni
#
class baselines::vmwaretools (
  $vmwaretools_package = $::baselines::params::vmwaretools_package,
) inherits baselines::params {

  if $::virtual == 'vmware' {
    if ( $::operatingsystem == 'Debian' and $::lsbmajdistrelease >= 7  )
    or ( $::operatingsystem == 'Ubuntu' and $::lsbmajdistrelease >= 14 )
    or ( $::osfamily == 'RedHat' and $::lsbmajdistrelease >= 6 ) {
      package { $vmwaretools_package: ensure => 'installed' }
    }
  }

}
