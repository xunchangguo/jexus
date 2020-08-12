FROM debian:buster-slim
MAINTAINER jamesqj <271686059@qq.com>

COPY bootstart.sh /usr/bin/
RUN chmod +x /usr/bin/bootstart.sh
# Install wget, download and install jexus, then cleanup
COPY install.sh /tmp/
COPY core3.1.sh /tmp/
RUN chmod +x /tmp/install.sh
RUN chmod +x /tmp/core3.1.sh
RUN /tmp/install.sh
RUN /tmp/core3.1.sh
RUN rm -rf /tmp/*
# Expost ports
EXPOSE 80 443
# Define volumes
#VOLUME ["/usr/jexus/siteconf", "/var/www", "/usr/jexus/log"]
# Define workdir
WORKDIR /usr/jexus
# Define startup scripts;
CMD ["/usr/bin/bootstart.sh"]
