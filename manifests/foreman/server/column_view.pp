class rbaselines::foreman::server::column_view {
  package { 'tfm-rubygem-foreman_column_view':
    ensure => 'installed',
  }

  file { '/etc/foreman/plugins/foreman_column_view.yaml':
    ensure  => 'file',
    source  => 'puppet:///modules/rbaselines/foreman/column_view/foreman_column_view.yaml',
    require => Package['tfm-rubygem-foreman_column_view'],
  }
}
