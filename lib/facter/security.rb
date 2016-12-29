Facter.add("vuln_shellshock") do
	confine :kernel => 'Linux'
	setcode do
		Facter::Util::Resolution.exec('/usr/bin/env x=\'() { :;}; echo "NOT_"\' bash -c "echo OK"')
	end
end
