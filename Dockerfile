
FROM debian:buster-slim
MAINTAINER jamesqj <271686059@qq.com>

COPY bootstart.sh /usr/bin/
RUN chmod +x /usr/bin/bootstart.sh
# Install wget, download and install jexus, then cleanup
COPY install.sh /tmp/
RUN chmod +x /tmp/install.sh
RUN /tmp/install.sh

# Expost ports
EXPOSE 80 443
# Define volumes
VOLUME ["/usr/jexus/siteconf", "/var/www", "/usr/jexus/log"]
# Define workdir
WORKDIR /usr/jexus
# Define startup scripts;
ENTRYPOINT ["/usr/bin/bootstart.sh"]
