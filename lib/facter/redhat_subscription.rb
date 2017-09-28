Facter.add("redhat_subscription") do
  confine :osfamily => 'RedHat'
  setcode '/sbin/subscription-manager status | grep "Status:" | tr -d " " | cut -d: -f2'
end
