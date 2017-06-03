class rbaselines::root (
  $password_hash,
  #  $ssh_keys,
) {

  user { 'root':
    password   => $password,
  }

}
