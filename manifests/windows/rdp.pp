class rbaselines::windows::rdp {
  require rbaselines::check_windows
  service { 'TermService':
    ensure => 'running',
    enable => 'true',
  }
}
