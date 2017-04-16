FROM ubuntu:14.04
MAINTAINER Yunei.Liuyun <j66x@163.com>

RUN apt-get update; apt-get -y upgrade; apt-get -y install wget curl ssh vim libx11-dev libfreetype6-dev libexpat-dev libglib2.0-bin
RUN curl https://jexus.org/release/x64/install.sh|sh

RUN sed -i -e 's/^PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN echo "root:password" | chpasswd && \
	  
      useradd admin  &&  echo "admin:jexus" | chpasswd
ADD bootstrap.sh /usr/bin/
RUN chmod +x /usr/bin/bootstrap.sh
RUN mkdir /data
RUN sed -i "s/root=\/ \/var\/www\/default/root=\/ \/data/g" /usr/jexus/siteconf/default
VOLUME ["/data"]

EXPOSE 80 22

ENV TERM="xterm"

WORKDIR /usr/jexus
ENTRYPOINT ["/usr/bin/bootstrap.sh"]
