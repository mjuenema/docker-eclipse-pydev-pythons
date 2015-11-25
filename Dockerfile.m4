#
# Eclipse+PyDev on CentOS6
#
# Markus Juenemann, 25-Nov-2015

FROM mjuenema/eclipse-pydev:VERSION
MAINTAINER Markus Juenemann <markus@juenemann.net>
USER root
WORKDIR /tmp
ENV HOME /tmp


# Install requirements
#
RUN yum -y install sqlite-devel \
                   gdbm-devel \
                   zlib-devel \
                   ncurses-devel \
                   openssl-devel \
                   readline-devel \
                   bzip2-devel \
                   libxslt-devel \
                   libxml2-devel \
                   gcc \
                   make \
                   file \
                   which


# Download get-pip.py
#
RUN wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py


# Python 2.6.9
#
RUN wget https://www.python.org/ftp/python/2.6.9/Python-2.6.9.tgz && \
    tar xvfz Python-2.6.9.tgz && \
    cd Python-2.6.9 && \
    ./configure && \
    make clean && \
    make && \
    make altinstall && \
    cd - && \
    /usr/local/bin/python2.6 get-pip.py && \
    rm -rfv Python*


# Python 2.7.10
#
RUN wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz && \
    tar xvfz Python-2.7.10.tgz && \
    cd Python-2.7.10 && \
    ./configure && \
    make clean && \
    make && \
    make altinstall && \
    cd - && \
    /usr/local/bin/python2.7 get-pip.py && \
    rm -rfv Python-*


# Python 3.3.6
#
RUN wget https://www.python.org/ftp/python/3.3.6/Python-3.3.6.tgz && \
    tar xvfz Python-3.3.6.tgz && \
    cd Python-3.3.6 && \
    ./configure && \
    make clean && \
    make && \
    make altinstall && \
    cd - && \
    /usr/local/bin/python3.3 get-pip.py && \
    rm -rfv Python-*


# Python 3.4.3
#
RUN wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz && \
    tar xvfz Python-3.4.3.tgz && \
    cd Python-3.4.3 && \
    ./configure && \
    make clean && \
    make && \
    make altinstall && \
    cd - && \
    /usr/local/bin/python3.4 get-pip.py && \
    rm -rfv Python-*



# Python 3.5.0
#
RUN wget https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz && \
    tar xvfz Python-3.5.0.tgz && \
    cd Python-3.5.0 && \
    ./configure && \
    make clean && \
    make && \
    make altinstall && \
    cd - && \
    /usr/local/bin/python3.5 get-pip.py && \
    rm -rfv Python-*


USER developer
ENV HOME /home/developer
WORKDIR /home/developer
CMD /bin/bash
