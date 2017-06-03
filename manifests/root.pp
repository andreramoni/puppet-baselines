class rbaselines::root (
  $password_hash,
) {
  user { 'root':
    password   => $password,
  }
}
