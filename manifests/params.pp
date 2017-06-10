class rbaselines::params {

  ########################################################################
  # Globals:
  #$puppet_server = 'foreman'
  $puppet_server = generate('/bin/hostname')

  # Foreman-proxy pub key:
  $foreman_proxy_pubkey = 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCfZHrv295HDzBWnpsrMFrvjQLjBxy4Ns9eO+mdwrpiSVqWxgfQ5JZ5kxoq6FfzODsn7la655A5khVsVYe8LD9bg4Nd2oakWch8trizBjlGvQLFf50rojI9t68Sv6Sm4C+UBGDWiJeZIFdSCWVA7HxX4hF64NYTbwCubglFrIjwfJar5iAnTxerJZJ22p2WgR4MmZS3lzbMXBWaqsiU1HAWZmE93LbMzPhEdah8+G09+W/s43rEjs5eTpj+rDskliO0XoDLsfyOlKg0l/x/cnhV8MC5mWrEX9FIqMrqiBRiIJv4fq8G44eRBzfYu3mRmzl0UvkelREXXhgBsGiTv20H'

  ########################################################################
  # Puppet agent:
  $puppet_agent_service = 'puppet'

  ########################################################################
  # inputrc:
  $inputrc_options = [
    'set show-all-if-ambiguous on',
    'set completion-ignore-case on',
  ]

  ########################################################################
  # vmwaretools:
  $vmwaretools_package = 'open-vm-tools'

  ########################################################################
  # hosts_localhost:
  $hosts_localhost = '/etc/hosts'

  ########################################################################
  # sysctl:
  $sysctl_options = [
    'set kernel.panic 3',
    'set vm.panic_on_oom 1',
  ]

  ########################################################################
  # ssh_server:
  $sshd_service = $::osfamily ? {
    'RedHat' => 'sshd',
    'Debian' => 'ssh',
    default  => undef,
  }
  $sshd_permitrootlogin = 'yes'
  $sshd_x11forwarding   = 'no'
  $sshd_usedns          = 'no'
  $sshd_printmotd       = 'no'
  $sshd_printlastlog    = 'no'

  ########################################################################
  # custom_profile:
  $custom_profile_file = '/etc/profile.d/custom_profile.sh'

  ########################################################################
  # ntp:
  $ntp_servers = [ 'br.pool.ntp.org', '1.pool.ntp.org', 'time-c.nist.gov']

  ########################################################################
  # packages:
  $packages_to_install = $::osfamily ? {
    'RedHat' => [
      'sudo', 'tcpdump', 'mtr', 'iptraf-ng', 'vim-enhanced', 'nload',
      'curl', 'hdparm', 'lshw', 'iotop', 'less', 'htop', 'traceroute',
      'screen', 'strace', 'mlocate', 'telnet', 'openssh-clients',
      'psmisc', 'sysfsutils', 'bash-completion',
    ],
    'Debian' => [
      'sudo', 'tcpdump', 'mtr', 'iptraf-ng', 'vim', 'nload',
      'curl', 'hdparm', 'lshw', 'iotop', 'less', 'htop', 'traceroute',
      'screen', 'strace', 'mlocate', 'telnet',
      'psmisc', 'sysfsutils', 'bash-completion',
    ],
    default  => undef,
  }
  $packages_to_remove = $::osfamily ? {
    'RedHat' => [ 'system-config-kdump' ],
    'Debian' => [ 'exim4' ],
    default  => undef,
  }

  ########################################################################
  # scripts:
  $scripts_dir = '/etc/scripts'

  ########################################################################
  # sysstate:
  $sysstate_cron = '/etc/cron.daily/sysstate.sh'
  $sysstate_dir  = '/etc/sysstate'
  $sysstate_script = 'rbaselines/sysstate/sysstate.sh.erb'

  ########################################################################
  # MCO:
  $mcoclient_user = 'mcoclient'
  $mcoclient_password = 'clientmco'
  $mco_plugins_dir = '/opt/puppetlabs/mcollective/mcollective/'
  $mco_broker = $puppet_server

  ########################################################################
  # foreman activemq:
  $activemq_package = 'activemq'
  $activemq_service = 'activemq'
  $activemq_cfgfile = '/etc/activemq/activemq.xml'
  $activemq_link_src = '/usr/share/activemq/activemq-data'
  $activemq_link_dst = '/var/cache/activemq/data'

  ########################################################################
  # timezone:
  $manage_timezone = true
  $timezone = 'Etc/UTC'

  ########################################################################
  # sudoers and groups:
  $sudo_admins_file = '/etc/sudoers.d/admins'
  $sudo_groups   = [ '', ]

  ########################################################################
  # Logrotate:
  $logrotate_rotate_every = 'day'
  $logrotate_rotate = '30'
  $logrotate_olddir = '/var/log/old'
  $logrotate_syslog_files = [
    '/var/log/cron',
    '/var/log/maillog',
    '/var/log/messages',
    '/var/log/secure',
    '/var/log/spooler',
    ]

  ########################################################################
  # swapfile:
  $swapfile = '/swapfile'
  $swapsize = '1 Gb'

  ########################################################################


}
