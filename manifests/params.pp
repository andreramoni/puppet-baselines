class rbaselines::params {

  ########################################################################
  # Globals:
  #$puppet_server = 'foreman'
  $puppet_server = generate('/bin/hostname')
  $puppet_runinterval = 1800
  $puppet_splay = false
  $puppet_splaylimit = 300
  # Foreman-proxy pub key:
  $foreman_proxy_pubkey = ''

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
  # packages:
  $packages_to_install = $::osfamily ? {
    'RedHat' => [ 
      'sudo', 'tcpdump', 'mtr', 'iptraf-ng', 'vim-enhanced', 
      'curl', 'hdparm', 'lshw', 'iotop', 'less', 'traceroute',
      'screen', 'strace', 'mlocate', 'telnet', 'openssh-clients',
      'psmisc', 'sysfsutils', 'bash-completion', 'net-tools',
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
  # cockpit:
  $cockpit_packages = $::osfamily ? {
    'RedHat' => [
      'cockpit-packagekit', 'cockpit-ws', 'cockpit-storaged', 'cockpit-subscriptions', 'cockpit-networkmanager',
    ],
    'Debian' => [
      'cockpit',
    ],
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
  # sudoers and groups:
  $sudo_admins_file = '/etc/sudoers.d/admins'
  $sudo_groups   = [ '', ]

  ########################################################################
  # Used by common/vmtools.pp:
  $vmtools_pkg = $::osfamily ? {
    'RedHat'  => 'open-vm-tools',
    'Windows' => 'vmware-tools',
  }
  
  $vmtools_srv = $::osfamily ? {
    'RedHat'  => 'vmtoolsd',
    'Windows' => 'VMTools',
  }

  ########################################################################
  # Used by common/timezone.pp
  $manage_timezone = 'yes'
  $timezone = 'Etc/UTC'

  ########################################################################
  # Used by common/ntp.pp
  $manage_ntp = 'yes'
  $ntp_servers = [ 'br.pool.ntp.org' ]

  ########################################################################


  ########################################################################




}
