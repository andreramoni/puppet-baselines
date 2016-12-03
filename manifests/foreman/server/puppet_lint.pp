class rbaselines::foreman::server::puppet_lint {
  package { 'rubygem-puppet-lint':
    ensure => 'installed',
  }
}
