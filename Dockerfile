FROM michaelholttech/baseimage:0.0.2
MAINTAINER Michael Holt <mike@holtit.com>
CMD ["/sbin/my_init"]
ADD puppetlabs-release-pc1-trusty.deb /root/puppetlabs-release-pc1-trusty.deb
RUN curl --fail -L https://nightlies.puppetlabs.com/puppetserver-latest/repo_configs/deb/pl-puppetserver-latest-trusty.list -o /etc/apt/sources.list.d pl-puppetserver-latest-trusty.list && \
  apt-get update -y && apt-get install -y ruby-dev cron wget build-essential libsqlite3-dev puppetserver && \
  /usr/bin/puppetserver gem install jdbc-sqlite3 && \
  /usr/bin/puppetserver gem install CFPropertyList && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir -p /etc/service/puppetserver
RUN mkdir -p /etc/my_init.d
ADD my_init.d/* /etc/my_init.d/
ADD puppetserver.sh /etc/service/puppetserver/run
ADD conf/puppet.conf /etc/puppet/puppet.conf
