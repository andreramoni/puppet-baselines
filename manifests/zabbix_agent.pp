

class rbaselines::zabbix_agent (
  $zabbix_server = 'zabbix.ramoni.com.br',
) {

  package { 'zabbix22-agent': ensure => 'installed' }
  file { '/etc/zabbix/zabbix_agentd.conf':
    ensure  => file,
    content => template('rbaselines/zabbix_agent/zabbix_agentd.conf.erb'),
    require => Package['zabbix22-agent'],
    notify  => Service['zabbix-agent']
  }
  service { 'zabbix-agent':
    ensure => running,
    enable => true,
  }

}
