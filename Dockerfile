FROM michaelholttech/baseimage:0.0.1
MAINTAINER Michael Holt <mike@holtit.com>
ADD puppetlabs-release-trusty.deb /root/puppetlabs-release-trusty.deb
RUN dpkg -i /root/puppetlabs-release-trusty.deb && apt-get update && apt-get install puppetserver -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
