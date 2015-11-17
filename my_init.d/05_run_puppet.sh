#!/bin/bash

# load environment variables
source /etc/container_environment.sh

# default cron setting is every 30 minutes
test -z "$PUPPET_AGENT_CRON" && export PUPPET_AGENT_CRON="0,30 * * * *"

read -d '' cronscript <<EOF
# Runs the Puppet Agent on a Schedule!
SHELL=/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin
@reboot root sleep 200 && /usr/bin/puppet agent -t
$PUPPET_AGENT_CRON root /usr/bin/puppet agent -t
EOF

echo "$cronscript" > /etc/cron.d/puppet-agent && chmod +x /etc/cron.d/puppet-agent
