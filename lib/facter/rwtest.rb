Facter.add("rwtest") do
	confine :kernel => 'Linux'
	setcode do
		Facter::Util::Resolution.exec('touch /rwtest && touch /var/rwtest && rm /rwtest && rm /var/rwtest && echo "OK" || echo "NOT_OK"')
	end
end
