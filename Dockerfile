FROM ubuntu

RUN apt-get update
RUN apt-get -y  upgrade
RUN apt-get -y install wget curl

RUN curl https://jexus.org/release/x64/install.sh|sh

EXPOSE 80 22

WORKDIR /usr/jexus

ENV LD_LIBRARY_PATH=/usr/jexus/runtime/lib:$LD_LIBRARY_PATH
ENV PATH=/usr/jexus:$PATH
ENV TERM="xterm"

ENTRYPOINT ["/usr/jexus/jwss"]
