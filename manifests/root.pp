class rbaselines::root (
#  $foreman_proxy_pubkey = $::forerbaselines::params::foreman_proxy_pubkey,
) {
#  user { 'root':
#    password   => $password_hash,
#  }
  ssh_authorized_key {  'sshkey-foreman_proxy':
    ensure => present,
    type   => 'ssh-rsa',
    key    => $::foreman_proxy_pubkey,
    user   => 'root',
  }
}
