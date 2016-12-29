if Facter.value('kernel') == 'Linux'
	Facter.add("dns_resolvers") do
 		setcode 'cat /etc/resolv.conf  | grep "^nameserver" | awk \'{ print $2 }\' | tr \'\n\' \' \''
	end
end
