class rbaselines::logrotate (
  $logrotate_olddir = $::rbaselines::params::logrotate_olddir,
  $logrotate_syslog_files = $::rbaselines::params::logrotate_syslog_files,
  $logrotate_rotate = $::rbaselines::params::logrotate_rotate,
  $logrotate_rotate_every = $::rbaselines::params::logrotate_rotate_every,
) inherits rbaselines::params {

  file { $logrotate_olddir:
    ensure => directory,
  }
  # Defaults:
  class { '::logrotate':
    ensure  => present,
    config  => {
      dateext       => true,
      compress      => true,
      delaycompress => false,
      olddir        => $logrotate_olddir,
      ifempty       => true,

    },
    require => File[$logrotate_olddir],
  }

  # default logfiles
  logrotate::rule { 'syslog':
    path          => $logrotate_syslog_files,
    rotate        => $logrotate_rotate,
    rotate_every  => $logrotate_rotate_every,
    postrotate    => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    sharedscripts => true,
  }
}
