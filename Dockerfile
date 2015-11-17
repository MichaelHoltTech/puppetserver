FROM michaelholttech/baseimage:0.0.2
MAINTAINER Michael Holt <mike@holtit.com>
CMD ["/sbin/my_init"]
RUN apt-get update -y && apt-get install -y ruby-dev cron wget build-essential libsqlite3-dev && \
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb && \
dpkg -i puppetlabs-release-trusty.deb && \
apt-get update && apt-get -y install puppetserver && rm puppetlabs-release-trusty.deb && \
/usr/bin/puppetserver gem install jdbc-sqlite3 && \
/usr/bin/puppetserver gem install CFPropertyList
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/puppetlabs-release-trusty.deb
RUN mkdir -p /etc/service/puppetserver
RUN mkdir -p /etc/my_init.d
ADD my_init.d/* /etc/my_init.d/
ADD puppetserver.sh /etc/service/puppetserver/run
ADD conf/puppet.conf /etc/puppet/puppet.conf
