FROM ubuntu
MAINTAINER Shaun McCloud<git@smccloud.com>
LABEL version="v0.1"

# Copy shell scripts
ADD run.sh /

# Setup the image
RUN apt-get update
RUN apt-get install -y syslog-ng

# Stop the container
STOPSIGNAL SIGTERM

# Expose the UDP port needed for syslog-ng to receive files
EXPOSE 514/udp

CMD ["/bin/bash", "/run.sh"]
