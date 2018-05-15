class rbaselines::common::ntp (
  $manage_ntp  = $::rbaselines::params::manage_ntp,
  $ntp_servers = $::rbaselines::params::ntp_servers,
) inherits rbaselines::params {
  if $manage_ntp {
    case $::kernel {
      'Linux': {
        class { '::chrony':
          servers => $ntp_servers,
        }      
      }
      'Windows': {
        class { 'windowstime':
          servers => [ 'pool.ntp.org' , 'time.windows.com' ]
        }
      }
      default: {
        fail("This class suports only windows and linux. Detected: ${::kernel}")
      }
    }
  }
}
