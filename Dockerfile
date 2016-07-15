# This for mono-opt under ubuntu 14.04.2
FROM centos:7
RUN yum install -y libunwind libicu

EXPOSE 5000  22  80


#&& /usr/jexus/jws start
#ENTRYPOINT /usr/sbin/sshd -D 
#CMD    ["/usr/sbin/sshd", "-D"]
CMD  /data/jexus/jws start 


