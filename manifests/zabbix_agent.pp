

class rbaselines::zabbix_agent (
  $zabbix_server = 'zabbix.ramoni.com.br',
) {

  package { 'zabbix_agent': ensure => 'installed' }
  file { '/etc/zabbix/zabbix_agend.conf':
    ensure  => file,
    content => template('rbaselines/zabbix_agent/zabbix_agentd.conf.erb'),
    require => Package['zabbix_agent'],
    notify  => Service['zabbix_agent']
  }
  service { 'zabbix_agent':
    ensure => running,
    enable => true,
  }

}
