class rbaselines::linux::foreman_proxy_pubkey (
  $foreman_proxy_pubkey = $::rbaselines::params::foreman_proxy_pubkey,
) {
  ssh_authorized_key {  'sshkey-foreman_proxy':
    ensure => present,
    type   => 'ssh-rsa',
    key    => $foreman_proxy_pubkey,
    user   => 'root',
  }
}
