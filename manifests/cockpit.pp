class rbaselines::cockpit (
  $cockpit_packages = $::rbaselines::params::cockpit_packages,
) inherits rbaselines::params {
  package { $cockpit_packages: 
    ensure => 'installed', 
  }
  service { 'cockpit':
    ensure => running,
    enable => true,
  }
}
