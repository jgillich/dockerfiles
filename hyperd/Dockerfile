FROM centos:7

RUN yum update -y && \
    yum install -y \
      e2fsprogs \
      https://hypercontainer-install.s3.amazonaws.com/hyper-container-0.7.0-1.el7.centos.x86_64.rpm \
      https://hypercontainer-install.s3.amazonaws.com/hyperstart-0.7.0-1.el7.centos.x86_64.rpm \
      https://hypercontainer-install.s3.amazonaws.com/qemu-hyper-2.4.1-2.el7.centos.x86_64.rpm

ADD config /etc/hyper/config

ADD ./run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

CMD run.sh
