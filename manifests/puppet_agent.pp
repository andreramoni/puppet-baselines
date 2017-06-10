class rbaselines::puppet_agent (
  $puppet_agent_service = $::rbaselines::params::puppet_agent_service,
  $puppet_server = $::rbaselines::params::puppet_server,
) inherits rbaselines::params {
  service { $puppet_agent_service:
    ensure => running,
    enable => true,
  }
  augeas { 'puppet_conf':
    context => '/files/etc/puppetlabs/puppet/puppet.conf',
    changes => [
      "set agent/server ${puppet_server}",
    ],
    notify  => Service[$puppet_agent_service],
  }
}
