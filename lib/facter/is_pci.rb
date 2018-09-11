case Facter.value('network')
when '10.10.4.0', '10.10.5.0', '10.10.6.0'
  is_pci = true
else
  is_pci = false
end


Facter.add("is_pci") do
  setcode do
    is_pci
  end
end
