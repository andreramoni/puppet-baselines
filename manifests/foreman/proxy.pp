class rbaselines::foreman::proxy {
  include rbaselines::foreman::proxy::squid
  include rbaselines::foreman::proxy::iptables
  include rbaselines::foreman::proxy::ip_forward
}
