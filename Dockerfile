FROM ubuntu

RUN apt-get update
RUN apt-get -y  upgrade
RUN apt-get -y install wget curl
RUN apt-get -y install --force-yes openssh-server
RUN  sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd && \
      echo "root:jexus" |chpasswd  && \
      useradd admin  &&  echo "admin:jexus" | chpasswd  &&  echo "admin   ALL=(ALL)       ALL" >> /etc/sudoers
RUN sed -i 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd
RUN curl https://jexus.org/release/x64/install.sh|sh
RUN mkdir /data
RUN sed -i "s/root=\/ \/var\/www\/default/root=\/ \/data/g" /usr/jexus/siteconf/default
#RUN sed -i "s/# AppHost=/AppRoot=/g" /usr/jexus/siteconf/default
#RUN sed -i "s/\CmdLine=\/usr\/local\/x\/xx;AppRoot=\/usr\/local\/x/CmdLine=\/data\/local\/webapp;AppRoot=\/data\/local/g" /usr/jexus/siteconf/default
VOLUME ["/data"]
EXPOSE 80 22

WORKDIR /usr/jexus

ENV LD_LIBRARY_PATH=/usr/jexus/runtime/lib:$LD_LIBRARY_PATH
ENV PATH=/usr/jexus:$PATH
ENV TERM="xterm"

ENTRYPOINT ["/usr/jexus/jwss"]
