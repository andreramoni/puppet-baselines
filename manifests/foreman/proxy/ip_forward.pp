class rbaselines::foreman::proxy::ip_forward {
  rbaselines::sysctl { 'ip_forwarding':
    sysctl_options => [ 'net.ipv4.ip_forward = 1',] ,
  }
}
