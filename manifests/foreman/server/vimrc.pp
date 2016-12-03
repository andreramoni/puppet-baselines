class rbaselines::foreman::server::vimrc {
  file { '/etc/vim':
    ensure => 'directory',
  }
  file { '/etc/vim/vimrc.puppet':
    ensure => 'present',
    mode   => '0644',
    source => 'puppet:///modules/rbaselines/foreman/vimrc/vimrc.puppet',
    require => File['/etc/vim'],
  }
}

