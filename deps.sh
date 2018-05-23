#!/bin/bash
puppet module install puppetlabs-ntp
puppet module install saz-timezone
puppet module install puppet-mcollective
puppet module install puppetlabs-chocolatey
puppet module install aboe-chrony
puppet module install tse-winntp 
<<<<<<< HEAD
git clone https://github.com/rismoney/puppet-windowsnetwork.git windowsnetwork
puppet module install crayfishx-network_config
=======
puppet module install crayfishx-network_config 
>>>>>>> 8bc142a884291b8c2064993319f04e43cecf508b
