FROM ubuntu
MAINTAINER Shaun McCloud<git@smccloud.com>
LABEL version="v0.1"

# Setup the image
RUN apt-get update
RUN apt-get install -y syslog-ng

ADD syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

# Expose the UDP port needed for syslog-ng to receive files
EXPOSE 514/udp

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
