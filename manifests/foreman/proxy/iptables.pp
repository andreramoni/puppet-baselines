class rbaselines::foreman::proxy::iptables {
  firewall { '01 NAT-OUT':
    chain    => 'POSTROUTING',
    jump     => 'MASQUERADE',
    proto    => 'all',
    outiface => $facts['networking']['primary'],
    table    => 'nat',
  }
  firewall { '01 REDIRECT':
    chain   => 'PREROUTING',
    jump    => 'REDIRECT',
    proto   => 'udp',
    dport   => '53',
    toports => '53',
    table   => 'nat',
  }

}
