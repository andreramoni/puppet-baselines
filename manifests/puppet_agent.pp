class rbaselines::puppet_agent (
  $puppet_agent_service = $::rbaselines::params::puppet_agent_service,
  $puppet_server = $::rbaselines::params::puppet_server,
  $puppet_runinterval = $::rbaselines::params::puppet_runinterval,
) inherits rbaselines::params {
  service { $puppet_agent_service:
    ensure => running,
    enable => true,
  }
  augeas { 'puppet_conf':
    context => '/files/etc/puppetlabs/puppet/puppet.conf',
    changes => [ "set agent/server ${puppet_server}",
                 "set agent/runinterval ${puppet_runinterval}", ],
    notify  => Service[$puppet_agent_service],
  }
}
