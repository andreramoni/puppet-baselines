Facter.add("ntpsync") do
	confine :kernel => 'Linux'
	setcode do
		Facter::Util::Resolution.exec('ntpq -p | cut -f1 -d \' \' | grep ^* || echo NONE')
	end
end
