class baselines::params {


  # inputrc:
  $inputrc_options = [
    'set show-all-if-ambiguous on',
    'set completion-ignore-case on',
  ]

  # vmwaretools:
  $vmwaretools_package = 'open-vm-tools'

  # hosts_localhost:
  $hosts_localhost = '/etc/hosts'

  # sysctl:
  $sysctl_options = [
    'set kernel.panic 3',
    'set vm.panic_on_oom 1',
  ]

  # ssh_server:
  $sshd_service = $::osfamily ? {
    'RedHat' => 'sshd',
    'Debian' => 'ssh',
  }
<<<<<<< HEAD

=======
>>>>>>> 83e2e966910e42fceeec35476cfc2fc6d9a7832a
  $sshd_permitrootlogin = 'yes'
  $sshd_x11forwarding   = 'no'
  $sshd_usedns          = 'no'
  $sshd_printmotd       = 'no'
  $sshd_printlastlog    = 'no'

}
