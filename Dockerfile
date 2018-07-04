FROM centos:7
RUN yum install -y make gcc wget zlib-devel openssl-devel
RUN yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel
RUN yum install -y wget

RUN wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tgz
RUN tar xf Python-3.6.5.tgz
WORKDIR Python-3.6.5
RUN ./configure --disable-shared --prefix=/tmp/python-3.6.5-static --enable-optimizations
RUN make -j 8
RUN make install
WORKDIR /root
RUN wget https://ftp.gnu.org/gnu/make/make-4.2.tar.gz
RUN tar xf make-4.2.tar.gz 
WORKDIR /root/make-4.2
RUN ./configure --prefix=/tmp/make-4.2
RUN make -j 8 install

RUN tar czf /bundle-python-3.6.5-static.tgz -C /tmp python-3.6.5-static
RUN tar czf /bundle-make-4.2.tgz -C /tmp make-4.2
