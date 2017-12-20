#FROM perl:5.20
#RUN  mkdir -p /app
#COPY . /app/
#WORKDIR /app
#RUN chmod u+x /app/inst_ws.sh
#RUN /app/inst_ws.sh
#EXPOSE 80
#COPY ./docker-entrypoint.sh /
#RUN chmod u+x /docker-entrypoint.sh
#ENTRYPOINT ["/docker-entrypoint.sh"]

# Dockerfile for building Ansible image for Ubuntu 16.04 (Xenial), with as few additional software as possible.
#
# @see https://launchpad.net/~ansible/+archive/ubuntu/ansible
#
# Version 1.0
#
# pull base image
FROM ubuntu:16.04
MAINTAINER William Yeh <william.pjyeh@gmail.com>
RUN echo "===> Adding Ansible's PPA..." && \
 echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu xenial main" | tee /etc/apt/sources.list.d/ansible.list && \
 echo "deb-src http://ppa.launchpad.net/ansible/ansible/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/ansible.list && \
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7BB9C367 && \
 DEBIAN_FRONTEND=noninteractive apt-get update && \
 \
 \
 echo "===> Installing Ansible..." && \
 apt-get install -y ansible && \
 \
 \
 echo "===> Installing handy tools (not absolutely required)..." && \
 apt-get install -y python-pip && \
 pip install --upgrade pywinrm && \
 apt-get install -y sshpass openssh-client && \
 \
 \
 echo "===> Removing Ansible PPA..." && \
 rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/ansible.list && \
 \
 \
 echo "===> Adding hosts for convenience..." && \
 echo 'localhost' > /etc/ansible/hosts


# default command: display Ansible version
#CMD [ "ansible-playbook", "--version" ]

#RUN  mkdir -p /app
#COPY . /app/
WORKDIR /app


COPY ./docker-entrypoint.sh /
RUN chmod u+x /docker-entrypoint.sh


EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
