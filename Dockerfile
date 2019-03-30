FROM debian:latest

MAINTAINER Mongo <willem@xcloudbiz.com>

RUN apt-get update \

        && apt-get -y install wget openssh-server sudo \

        && cd /usr \

        && wget http://www.linuxdot.net/down/jexus-5.8.3-x64.tar.gz \

        && tar -zxvf jexus-5.8.3-x64.tar.gz \

        && apt-get -y autoremove --purge wget \

        && rm -rf /var/lib/apt/lists/* jexus-5.8.3-x64.tar.gz

RUN mkdir /var/run/sshd
#RUN chmod  4755  /usr/sbin/chpasswd
#RUN sudo echo 'root:1234abcd' | chpasswd
RUN sudo useradd -m jexus -g sudo -s /bin/bash -d /home/jexus
#RUN sudo passwd jexus
RUN sudo echo 'jexus:abc' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 80 22

WORKDIR /usr/jexus

CMD sudo /usr/jexus/jwss
CMD ["/usr/sbin/sshd", "-D"]
