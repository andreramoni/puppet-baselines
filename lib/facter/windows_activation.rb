Facter.add('windows_activation') do
    confine :osfamily => :windows
    setcode do
      powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
      command = '(Get-CimInstance -ClassName SoftwareLicensingProduct | where PartialProductKey).LicenseStatus'
      Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{command}"})
    end
end