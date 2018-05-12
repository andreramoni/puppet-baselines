class rbaselines::windows::winrm {
  require rbaselines::check_windows
  service { 'winrm':
    ensure => 'running',
    enable => 'true',
  }
}
