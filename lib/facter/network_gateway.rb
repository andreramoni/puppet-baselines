if Facter.value('kernel') == 'Linux'
    Facter.add("network_gateway") do
        setcode '/sbin/ip ro sh | grep default | awk \'{print $3}\' '
    end
end

if Facter.value('kernel') == 'windows'
  Facter.add("network_gateway") do
    setcode do
      powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
      command = 'GWMI Win32_NetworkAdapterConfiguration | where {$_.IPAddress -ne $null -and $_.DefaultIPGateway -ne $null} | Select-Object -ExpandProperty DefaultIPGateway'
      Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{command}"})
    end
  end
end

