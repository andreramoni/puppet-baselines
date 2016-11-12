class olx_base::linux::inputrc {
  require olx_base::linux

  File_line {
    path  => '/etc/inputrc',
    multiple => true,
  }
  
  file_line { 'inputrc_showall':
    ensure => 'present',
    line   => 'set show-all-if-ambiguous on',
    match  => '^set show-all-if-ambiguous.*',
  }
  file_line { 'inputrc_completion':
    ensure => 'present',
    line   => 'set completion-ignore-case on',
    match  => '^set completion-ignore-case.*',
  }
}

