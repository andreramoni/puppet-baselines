class rbaselines::common::dns (
  $manage_dns  = $::rbaselines::params::manage_dns,
  $dns_servers = $::rbaselines::params::dns_servers,
) inherits rbaselines::params {
  if $manage_dns {
    case $::kernel {
      'Linux':   { 
        network_interface { $::facts['networking']['primary']:
           dns1 => $dns_servers[0],
           dns2 => $dns_servers[1],
        }
      }
      'Windows': { 
        ipconfig { $::facts['networking']['primary']:
          ensure => present,
          dns    => $dns_servers,
        }
      }
      default: { fail("This class suports only windows and linux. Detected: ${::kernel}") }
    }
  }
}

