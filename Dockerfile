FROM amazon/aws-efs-csi-driver:v1.4.2

RUN yum install -y gcc openssl-devel tcp_wrappers-devel && \
    yum clean all && \
    rm -rf /var/cache/yum

RUN curl -o stunnel-5.66.tar.gz https://www.stunnel.org/downloads/stunnel-5.66.tar.gz && \
    tar -zxvf stunnel-5.66.tar.gz && \
    cd stunnel-5.66 && \
    ./configure --prefix=/usr && \
    make &&  \
    rm /usr/bin/stunnel && \
    make install && \
    rm -f /stunnel-5.66.tar.gz && \
    rm -rf /stunnel-5.66 && \
    stunnel -version
