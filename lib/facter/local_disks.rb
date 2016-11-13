Facter.add("local_disks") do
	confine :kernel => 'Linux'
	setcode do
		Facter::Util::Resolution.exec('find /sys/block -name "[hs]d[a-z]" -exec basename {} \;')
	end
end
