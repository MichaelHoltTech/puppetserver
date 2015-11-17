FROM michaelholttech/baseimage:0.0.1
MAINTAINER Michael Holt <mike@holtit.com>
CMD ["/sbin/my_init"]
ADD puppetlabs-release-trusty.deb /root/puppetlabs-release-trusty.deb
RUN dpkg -i /root/puppetlabs-release-trusty.deb && apt-get update && apt-get install puppetserver -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/puppetlabs-release-trusty.deb
RUN mkdir -p /etc/service/puppetserver
RUN mkdir -p /etc/my_init.d
ADD my_init.d/* /etc/my_init.d/
ADD puppetserver.sh /etc/service/puppetserver/run
ADD conf/puppet.conf /etc/puppet/puppet.conf
