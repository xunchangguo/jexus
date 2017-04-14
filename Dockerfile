FROM ubuntu

RUN apt-get update
RUN apt-get -y  upgrade
RUN apt-get -y install wget curl

RUN curl https://jexus.org/release/x64/install.sh|sh
RUN mkdir /data
RUN sed -i "s/root=\/ \/var\/www\/default/root=\/ \/data/g" /usr/jexus/siteconf/default
RUN sed -i "s/# AppHost=/AppRoot=/g" /usr/jexus/siteconf/default
RUN sed -i "s/\CmdLine=\/usr\/local\/x\/xx;AppRoot=\/usr\/local\/x/CmdLine=\/data\/local\/webapp;AppRoot=\/data\/local/g" /usr/jexus/siteconf/default
VOLUME ["/data"]
EXPOSE 80 22

WORKDIR /usr/jexus

ENV LD_LIBRARY_PATH=/usr/jexus/runtime/lib:$LD_LIBRARY_PATH
ENV PATH=/usr/jexus:$PATH
ENV TERM="xterm"

ENTRYPOINT ["/usr/jexus/jwss"]
