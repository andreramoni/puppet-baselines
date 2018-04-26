if Facter.value('kernel') == 'Linux'
	Facter.add("iface_mgmt") do
 		setcode 'ip a sh | grep -P "inet 10.255\." | awk \'{print $NF}\' | cut -f1 -d: | head -n 1'
	end
end

if Facter.value('kernel') == 'Linux'
	Facter.add("iface_mgmt_ip") do
 		setcode 'ip a sh | grep -P "inet 10.255\." | awk \'{print $2}\' | head -n 1 | cut -f1 -d/'
	end
end

if Facter.value('kernel') == 'Linux'
	Facter.add("iface_ext") do
 		setcode 'ip a sh | grep -P "inet 192.168.12\." | awk \'{print $NF}\' | grep -v lo | cut -f1 -d: | head -n 1'
	end
end

if Facter.value('kernel') == 'Linux'
	Facter.add("iface_ext_ip") do
 		setcode 'ip a sh | grep -P "inet 192.168.12\." | awk \'{print $2}\' | head -n 1 | cut -f1 -d/'
	end
end

if Facter.value('kernel') == 'Linux'
	Facter.add("iface_srv") do
 		setcode 'ip a sh | grep -P "inet 10.0\." | awk \'{print $NF}\' | cut -f1 -d: |  head -n 1'
	end
end

if Facter.value('kernel') == 'Linux'
	Facter.add("iface_srv_ip") do
 		setcode 'ip a sh | grep -P "inet 10.0\." | awk \'{print $2}\' | head -n 1 | cut -f1 -d/'
	end
end

if Facter.value('kernel') == 'Linux'
	Facter.add("iface_dmz1") do
 		setcode 'ip a sh | grep -P "inet 10.1\." | awk \'{print $NF}\' |cut -f1 -d: |  head -n 1'
	end
end

if Facter.value('kernel') == 'Linux'
	Facter.add("iface_dmz1_ip") do
 		setcode 'ip a sh | grep -P "inet 10.1\." | awk \'{print $2}\' | head -n 1 | cut -f1 -d/'
	end
end
