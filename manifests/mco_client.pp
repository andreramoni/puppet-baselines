class rbaselines::mco_client (
  $mcoclient_user = $::rbaselines::params::mcoclient_user,
  $mcoclient_password = $::rbaselines::params::mcoclient_password,
  $mco_broker = $::rbaselines::params::mco_broker,
) inherits rbaselines::params {
  class { '::mcollective':
    client              => true,
    middleware_user     => $mcoclient_user,
    middleware_password => $mcoclient_password,
    middleware_hosts    => [ $mco_broker ],
  }

}
