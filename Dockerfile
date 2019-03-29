# This for mono-opt under ubuntu 14.04.2

FROM ubuntu

RUN apt-get update && \

        apt-get install -y --force-yes openssh-server curl sqlite3 libsqlite3-dev
RUN apt-get -y  upgrade
RUN apt-get -y install wget
RUN  sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

#RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /var/run/sshd && \

      echo "root:jexus" |chpasswd  && \

      useradd admin  &&  echo "admin:jexus" | chpasswd  &&  echo "admin   ALL=(ALL)       ALL" >> /etc/sudoers 



# Fix PAM login issue with sshd

RUN sed -i 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd



RUN curl https://jexus.org/release/x64/install.sh|sh

RUN sed -i 's/SiteLogDir=log/SiteLogDir=/data/jwslog/g' /usr/jesus/jws.conf && sed -i 's/SiteConfigDir=siteconf/SiteConfigDir=/data/siteconf/g' /usr/jexus/jws.conf

RUN  sed -i "s/root=\/ \/var\/www\/default/root=\/ \/data/g" /data/jexus/siteconf/default



VOLUME ["/data"]

#RUN  mv jexus /data

#RUN rm -rf /tmp/jexus*

#RUN  sed -i "s/root=\/ \/var\/www\/default/root=\/ \/data/g" /data/jexus/siteconf/default

#open port for ssh 

EXPOSE 22 80



# open port for jexus web server

#EXPOSE 8081



# open port for default http 80

#EXPOSE 80





ENV LD_LIBRARY_PATH=/usr/jexus/runtime/lib:$LD_LIBRARY_PATH
ENV PATH=/usr/jexus:$PATH
ENV TERM="xterm"

ENTRYPOINT ["/usr/jexus/jwss"]
WORKDIR /usr/jexus



#&& /usr/jexus/jws start

#ENTRYPOINT /usr/sbin/sshd -D 

#CMD    ["/usr/sbin/sshd", "-D"]

CMD  /var/jexus/jws start && /usr/sbin/sshd -D
