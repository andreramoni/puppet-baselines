class rbaselines::linux::puppet_agent (
  $puppet_agent_service = $::rbaselines::params::puppet_agent_service,
  $puppet_server = $::rbaselines::params::puppet_server,
  $puppet_runinterval = $::rbaselines::params::puppet_runinterval,
  $puppet_splay = $::rbaselines::params::puppet_splay,
  $puppet_splaylimit = $::rbaselines::params::puppet_splaylimit,
) inherits rbaselines::params {
  service { $puppet_agent_service:
    ensure => running,
    enable => true,
  }
  augeas { 'puppet_conf':
    context => '/files/etc/puppetlabs/puppet/puppet.conf',
    changes => [ "set agent/server ${puppet_server}",
                 "set agent/runinterval ${puppet_runinterval}", 
                 "set agent/splay ${puppet_splay}", 
                 "set agent/splaylimit ${puppet_splaylimit}", ],
    notify  => Service[$puppet_agent_service],
  }
}
