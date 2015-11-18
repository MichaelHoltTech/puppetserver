#!/bin/bash
cat << EOF >> /etc/default/puppet
# Defaults for puppet - sourced by /etc/init.d/puppet

# Enable puppet agent service?
# Setting this to "yes" allows the puppet agent service to run.
# Setting this to "no" keeps the puppet agent service from running.
START=yes

# Startup options
DAEMON_OPTS=""
EOF
mkdir -p /root/bootstrap/modules
puppet module install --modulepath=/root/bootstrap/modules zack/r10k
puppet module install --modulepath=/root/bootstrap/modules stahnma/epel
puppet module install --modulepath=/root/bootstrap/modules stephenrjohnson/puppet
puppet module install --modulepath=/root/bootstrap/modules hunner/hiera
puppet module install --modulepath=/root/bootstrap/modules puppetlabs/stdlib

if [ "$ssh_rsa_key" ]; then
  "$ssh_rsa_key" > "/root/.ssh/id_rsa"
fi
if [ ! -f /root/.ssh/id_rsa ]; then
ssh-keygen -t rsa -b 4096 -f '/root/.ssh/id_rsa' -N '' -C 'R10K Deployment Key'
touch /root/.new_rsa
fi

sudo puppet apply --hiera_config /root/bootstrap/hiera/hiera.yaml --modulepath=/root/bootstrap/modules /root/bootstrap/configure.pp

if [ ! -f /root/.new_rsa ]; then
  r10k deploy environment -pv
fi
