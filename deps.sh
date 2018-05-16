#!/bin/bash

puppet module install puppetlabs-ntp
puppet module install saz-timezone
puppet module install puppet-mcollective
puppet module install puppetlabs-chocolatey
aboe-chrony
puppet module install tse-winntp 
