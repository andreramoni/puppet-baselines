class rbaselines::puppet_agent (
  $puppet_agent_service = $::rbaselines::params::puppet_agent_service,
) inherits rbaselines::params {
  service { $puppet_agent_service:
    ensure => running,
    enable => true,
  }
}
