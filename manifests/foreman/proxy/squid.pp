class rbaselines::foreman::proxy::squid {
  package { 'squid':
    ensure => present,
  }
  service { 'squid':
    ensure  => 'running',
    enable  => true,
    require => Package['squid'],
  }
  file { '/etc/squid/squid.conf':
    ensure  => 'file',
    #source => 'puppet:///modules/rbaselines/foreman/squid/squid.conf',
    content => template('rbaselines/foreman/squid/squid.conf.erb'),
    notify  => Service['squid'],
    require => Package['squid'],
  }
}
