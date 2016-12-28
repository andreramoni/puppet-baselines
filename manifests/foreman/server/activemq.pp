class rbaselines::foreman::server::activemq (
  $activemq_package = $::rbaselines::params::activemq_package,
  $activemq_service = $::rbaselines::params::activemq_service,
  $activemq_link_src = $::rbaselines::params::activemq_link_src,
  $activemq_link_dst = $::rbaselines::params::activemq_link_dst,
  $activemq_cfgfile = $::rbaselines::params::activemq_cfgfile,
) inherits rbaselines::params {
  require rbaselines::repos::puppetlabs_deps
  package { $activemq_package:
    ensure => 'present',
  }
  file { $activemq_link_src:
    ensure  => 'link',
    target  => $activemq_link_dst,
    require => Package[$activemq_package],
  }
  file { $activemq_cfgfile:
    ensure  => 'file',
    content => template('rbaselines/foreman/activemq/activemq.xml.erb'),
    require => Package['activemq'],
    notify  => Service['activemq'],
  }
  file { '/etc/httpd/conf.d/activemq-httpd.conf':
    ensure => 'absent',
  }

  service { $activemq_service:
    ensure  => 'running',
    enable  => true,
    require => Package[$activemq_package],
  }
}
