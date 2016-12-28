class rbaselines::foreman::server {
  include rbaselines::foreman::server::puppet_lint
  include rbaselines::foreman::server::vimrc
  include rbaselines::foreman::server::column_view
  include rbaselines::foreman::server::activemq
}
