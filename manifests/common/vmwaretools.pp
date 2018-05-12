class rbaselines::common::vmwaretools (
  $vmtools_pkg = $::rbaselines::params::vmtools_pkg,
  $vmtools_srv = $::rbaselines::params::vmtools_srv,
) inherits rbaselines::params {
  if $::virtual == 'vmware' {
    package { $vmtools_pkg: ensure => 'installed' }
    service { $vmtools_srv: ensure => 'running', enable => 'true' }
  }
}
