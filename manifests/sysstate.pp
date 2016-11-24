class rbaselines::sysstate (
  $sysstate_dir    = $::rbaselines::params::sysstate_dir,
  $sysstate_cron   = $::rbaselines::params::sysstate_cron,
  $sysstate_script = $::rbaselines::params::sysstate_script,
) inherits rbaselines::params {
  file { $sysstate_dir:
    ensure => 'directory',
  }
  file { $sysstate_cron:
    ensure  => 'file',
    mode    => '0755',
    content => template($sysstate_script),
  }
}
