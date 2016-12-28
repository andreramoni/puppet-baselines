class rbaselines::mco_plugins (
  $mco_plugins_dir = $::rbaselines::params::mco_plugins_dir,
) inherits rbaselines::params {
  require rbaselines::mco_server

  mcollective::plugin { 'service':
    source => 'puppet:///modules/rbaselines/mcollective/plugins/service'
  }
  mcollective::plugin { 'package':
    source => 'puppet:///modules/rbaselines/mcollective/plugins/package'
  }
  mcollective::plugin { 'shell':
    source => 'puppet:///modules/rbaselines/mcollective/plugins/shell'
  }
  mcollective::plugin { 'puppet':
    source => 'puppet:///modules/rbaselines/mcollective/plugins/puppet'
  }
}
