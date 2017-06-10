Facter.add("foreman_proxy_pubkey") do
	confine :kernel => 'Linux'
	setcode do
		Facter::Util::Resolution.exec('test -f /usr/share/foreman-proxy/.ssh/id_rsa_foreman_proxy.pub && /usr/bin/cat /usr/share/foreman-proxy/.ssh/id_rsa_foreman_proxy.pub | /usr/bin/awk \'{print $2}\'')
	end
end
