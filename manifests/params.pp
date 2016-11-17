class baselines::params {

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
  #$sysctl_options = [
  #  'set kernel.panic 3',
  #  'set vm.panic_on_oom 1',
  #]
  $sysctl_reload_command = '/sbin/sysctl -p'

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
      'psmisc', 'sysfsutils', 'bind-utils', 'bash-completion',
    ],
    'Debian' => '',
    default  => undef,
  }
  $packages_to_remove = $::osfamily ? {
    'RedHat' => [ 'system-config-kdump' ],
    'Debian' => [ '' ],
    default  => undef,
  }

  ########################################################################
  # scripts:
  $scripts_dir = '/etc/scripts'


  ########################################################################


}
