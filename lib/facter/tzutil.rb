if Facter.value('kernel') == 'windows'
  Facter.add("tzutil") do
    setcode do
      powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
      command = 'tzutil /g'
      Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{command}"})
    end
  end
end

