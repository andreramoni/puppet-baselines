class rbaselines::linux::cockpit (
  $cockpit_packages = $::rbaselines::params::cockpit_packages,
) inherits rbaselines::params {
  package { $cockpit_packages: 
    ensure => 'installed', 
  }
  service { 'cockpit.socket':
    ensure => running,
    enable => true,
  }
}
