FROM ubuntu:18.04
RUN apt-get upgrade
RUN set -ex; \
    apt-get update \
    && apt-get install ssh wget npm -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'wstunnel -s 0.0.0.0:80 &' >>/1.sh
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:S111334|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80
CMD  /1.sh
