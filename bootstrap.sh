#!/usr/bin/env bash

# filename="puppet5-release-$(lsb_release -cs).deb"

# if [ ! -f $filename ]; then
#     wget "https://apt.puppetlabs.com/${filename}"
# fi

# dpkg -i "$filename"
# apt-get -qq update
apt-get install -y puppet-agent ruby-dev
gem install r10k && gem install generate-puppetfile
cd /vagrant/environments/${puppet_env} && r10k puppetfile install --verbose

echo -e "$(hostname -I)\t$(hostname)" >> /vagrant/hosts
