#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
if [ ! -f /root/.new_rsa ]
then
  exec /usr/bin/puppetserver foreground >> /var/log/syslog
else
  rm /root/.new_rsa
fi
