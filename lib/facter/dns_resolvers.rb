if Facter.value('kernel') == 'Linux'
	Facter.add("dns_resolvers") do
 		setcode 'cat /etc/resolv.conf  | grep "^nameserver" | awk \'{ print $2 }\' | tr \'\n\' \' \''
	end
end

if Facter.value('kernel') == 'windows'
	Facter.add("dns_resolvers") do
    		setcode do
      		powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
		command = 'Get-DnsClientServerAddress | Select-Object ServerAddresses | Where-Object {$_.ServerAddresses -ne $null}'
		Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{command}"})
    		end
  	end
end
