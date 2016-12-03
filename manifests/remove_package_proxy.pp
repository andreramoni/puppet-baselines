class rbaselines::remove_package_proxy (
) inherits rbaselines::params {


  Class['rbaselines::packages'] -> Class['rbaselines::remove_package_proxy']

  case $::osfamily {
    'RedHat': {
      file_line { 'remove_proxy':
        ensure   => absent,
        path     => '/etc/yum.conf',
        multiple => true,
        match    => '^proxy.*',
        line     => 'proxy = http://foreman:3128',
      }
    }
    'Debian': {
      file { '/etc/apt/apt.conf':
        ensure => file;
      }
      file_line { 'remove_proxy':
        ensure   => absent,
        path     => '/etc/apt/apt.conf',
        multiple => true,
        match    => '^Acquire::http::Proxy.*',
        line     => 'Acquire::http::Proxy "http://foreman:3128";',
      }
    }
    default: { fail("Not supported: ${::osfamily}") }

  }

}
