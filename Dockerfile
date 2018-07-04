FROM centos:7

RUN yum install -y make gcc wget
RUN wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tgz
RUN tar xf Python-3.6.5.tgz
WORKDIR Python-3.6.5
RUN ./configure --disable-shared --prefix=/opt/python-3.6.5-static --enable-optimizations
RUN make
RUN yum install -y zlib-devel
RUN make install
WORKDIR /root
RUN wget https://ftp.gnu.org/gnu/make/make-4.2.tar.gz
RUN tar xf make-4.2.tar.gz 
WORKDIR /root/make-4.2
RUN ./configure --prefix=/opt/make-4.2
RUN make install

RUN tar czf /bundle-python-3.6.5-static.tgz -C /opt python-3.6.5-static
RUN tar czf /bundle-make-4.2.tgz -C /opt make-4.2
