# This for mono-opt under ubuntu 14.04.2
FROM centos:7
#RUN yum install -y libunwind libicu
#RUN curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?LinkID=809131
#RUN mkdir -p /opt/dotnet && tar zxf dotnet.tar.gz -C /opt/dotnet
#RUN ln -s /opt/dotnet/dotnet /usr/local/bin
#RUN apt-get update \
#&& apt-get install -y --no-install-recommends \

 #       libunwind8 \

 #       libunwind8-dev \

  #      gettext \

  #      libicu-dev \

 #      liblttng-ust-dev \

  #      libcurl4-openssl-dev \

  #      libssl-dev \

#        uuid-dev \

 #      unzip \

#    && rm -rf /var/lib/apt/lists/*
# Install .NET Core

#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893

#ENV DOTNET_VERSION 1.0.0

#ENV DOTNET_DOWNLOAD_URL https://dotnetcli.blob.core.windows.net/dotnet/preview/Binaries/$DOTNET_VERSION/dotnet-ubuntu-x64.$DOTNET_VERSION.tar.gz


#add mono  official source
#RUN  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
#RUN sh -c "echo 'deb http://download.mono-project.com/repo/debian wheezy main' | sudo tee /etc/apt/sources.list.d/mono-xamarin.list"
#RUN apt-get update



#Install mono
#RUN apt-get update && \
        #apt-get install -y --force-yes mono-devel mono-complete referenceassemblies-pcl openssh-server curl sqlite3 libsqlite3-dev
#RUN apt-get update && \
     #   apt-get install -y --force-yes openssh-server curl sqlite3 libsqlite3-dev
#RUN sudo apt-get install -y --force-yes vim
#RUN  sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
#RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#RUN mkdir -p /var/run/sshd && \
 #     echo "root:jexus" |chpasswd  && \
 #     useradd admin  &&  echo "admin:jexus" | chpasswd  &&  echo "admin   ALL=(ALL)       ALL" >> /etc/sudoers 

# Fix PAM login issue with sshd
#RUN sed -i 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd

#set the PATH for mono-opt
#ENV PATH $PATH:/opt/mono/bin
#ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/opt/mono/lib
#ENV PKG_CONFIG_PATH $PKG_CONFIG_PATH:/opt/mono/lib/pkgconfig

# install mono web server Jexus
#RUN cd /tmp && curl http://jamesqj-jexus.daoapp.io/install | sh
#RUN cd /tmp
#RUN wget linuxdot.net/down/jexus-5.8.2-x64.tar.gz
#RUN tar -zxvf jexus-5.8.2-x64.tar.gz 
#RUN  mv jexus /usr
#RUN rm -rf /tmp/jexus*
#RUN cd jexus-5.8.1
#RUN sudo ./install
#RUN curl jexus.org/5.8.x/install|sh
#&& touch /data/x && mkdir /data/jwslog && mkdir /data/siteconf && mkdir /data/wwwroot
#RUN cp /usr/jexus/siteconf/default /data/siteconf/
#RUN cp /usr/jexus/jws.conf /usr/jexus/jws.conf.backup
#RUN sed -i 's/SiteLogDir=log/SiteLogDir=/data/jwslog/g' /usr/jesus/jws.conf && sed -i 's/SiteConfigDir=siteconf/SiteConfigDir=/data/siteconf/g' /usr/jexus/jws.conf
#RUN  sed -i "s/root=\/ \/var\/www\/default/root=\/ \/data/g" /data/jexus/siteconf/default

#VOLUME ["/data"]
#RUN  mv jexus /data
#RUN rm -rf /tmp/jexus*
#RUN  sed -i "s/root=\/ \/var\/www\/default/root=\/ \/data/g" /data/jexus/siteconf/default
# open port for ssh 
EXPOSE 5000  22  80

# open port for jexus web server
#EXPOSE 8081

# open port for default http 80
#EXPOSE 80


#&& /usr/jexus/jws start
#ENTRYPOINT /usr/sbin/sshd -D 
#CMD    ["/usr/sbin/sshd", "-D"]
CMD  /data/jexus/jws start #&& /usr/sbin/sshd -D


