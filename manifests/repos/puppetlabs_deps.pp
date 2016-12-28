class rbaselines::repos::puppetlabs_deps {
  yumrepo { 'puppetlabs-deps':
    ensure   => 'present',
    baseurl  => 'http://yum.puppetlabs.com/el/7/dependencies/$basearch',
    descr    => 'Puppet Labs Dependencies El 7 - $basearch',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs
       file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet',
  }
}
