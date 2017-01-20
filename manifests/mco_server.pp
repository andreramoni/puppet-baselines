class rbaselines::mco_server (
  $mcoclient_user = $::rbaselines::params::mcoclient_user,
  $mcoclient_password = $::rbaselines::params::mcoclient_password,
  $mco_broker = $::rbaselines::params::mco_broker,
) inherits rbaselines::params {
  unless $::osfamily == 'Debian' {
    class { '::mcollective':
      client              => false,
      middleware_user     => $mcoclient_user,
      middleware_password => $mcoclient_password,
      middleware_hosts    => [ $mco_broker ],
    }
  }

}
