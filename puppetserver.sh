#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
exec /usr/bin/puppetserver foreground >> /var/log/puppetserver.log 2>&1
