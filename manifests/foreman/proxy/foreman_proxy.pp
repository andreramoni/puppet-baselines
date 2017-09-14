class rbaselines::foreman::proxy::foreman_proxy (
  $tftp = true,
  $dhcp = true,
  $dns  = true,
) {
  class{'::foreman_proxy':
    ssl                 => true,
    register_in_foreman => false,
    puppet              => false,
    puppetca            => false,
    tftp                => true,
    dhcp                => true,
    dns                 => true,
    bmc                 => false,
    realm               => true,
  }
}