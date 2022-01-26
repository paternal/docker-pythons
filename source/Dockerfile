FROM debian
LABEL maintainer "Louis Paternault <spalax@gresille.org>"

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt update --yes \
  && \
  apt install --yes \
    wget \
    build-essential \
    libbz2-dev \
    libffi-dev \
    libgdbm-dev \
    libncurses5-dev \
    libnss3-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    zlib1g-dev \
  && \
  apt-get clean

################################################################################
# Python

# Python2.7
RUN \
  wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tar.xz \
  && tar -xf Python-2.7.18.tar.xz \
  && cd Python-2.7.18 \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm Python* -fr

# Python3.6
RUN \
  wget https://www.python.org/ftp/python/3.6.15/Python-3.6.15.tar.xz \
  && tar -xf Python*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python*

# Python3.7
RUN \
  wget https://www.python.org/ftp/python/3.7.12/Python-3.7.12.tar.xz \
  && tar -xf Python*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python*

# Python3.8
RUN \
  wget https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tar.xz \
  && tar -xf Python*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python*

# Python3.9
RUN \
  wget https://www.python.org/ftp/python/3.9.10/Python-3.9.10.tar.xz \
  && tar -xf Python*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python*

# Python3.10
RUN \
  wget https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tar.xz \
  && tar -xf Python*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make install \
  && cd .. \
  && rm -fr Python*

# Python3.11
RUN \
  wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0a4.tar.xz \
  && tar -xf Python*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python*

# Pip
RUN \
   for python in \
     python2.7 \
     python3.6 \
     python3.7 \
     python3.8 \
     python3.9 \
     python3.10 \
     python3.11 \
   ; do \
     $python -m ensurepip; \
     $python -m pip install -U pip setuptools; \
   done

################################################################################
# Pypy

# Pypy2.7
RUN \
  wget https://downloads.python.org/pypy/pypy2.7-v7.3.6-linux64.tar.bz2 \
  && tar -xf pypy*bz2 \
  && rm pypy*bz2 \
  && mv pypy* /opt

# Pypy3.7
RUN \
  wget https://downloads.python.org/pypy/pypy3.7-v7.3.7-linux64.tar.bz2 \
  && tar -xf pypy*bz2 \
  && rm pypy*bz2 \
  && mv pypy* /opt

# Pypy3.8
RUN \
  wget https://downloads.python.org/pypy/pypy3.8-v7.3.7-linux64.tar.bz2 \
  && tar -xf pypy*bz2 \
  && rm pypy*bz2 \
  && mv pypy* /opt

# Pypy symlinks
RUN \
  for version in 3.8 3.7; \
  do \
    ln -s /opt/pypy${version}*/bin/pypy${version} /usr/local/bin; \
    pypy${version} -m ensurepip; \
    pypy${version} -m pip install -U pip setuptools; \
  done; \
  ln -s /usr/local/bin/pypy3.8 /usr/local/bin/pypy3

RUN \
  ln -s /opt/pypy2.7*/bin/pypy /usr/local/bin \
  && pypy -m ensurepip \
  && pypy -m pip install -U pip setuptools

################################################################################
# Jython
RUN \
  apt install --yes openjdk-17-jre \
  && wget https://repo1.maven.org/maven2/org/python/jython-installer/2.7.2/jython-installer-2.7.2.jar \
  && java -jar jython-installer*.jar --silent --type standard --directory /opt/jython \
  && rm jython-installer*.jar \
  && ln -s /opt/jython/bin/jython /usr/local/bin/

RUN python3 -m pip install \
  black \
  coverage \
  pycodestyle \
  pylint \
  tox

# Print versions
RUN for bin in \
    python \
    python2 \
    python2.7 \
    python3 \
    python3.6 \
    python3.7 \
    python3.8 \
    python3.9 \
    python3.10 \
    python3.11 \
    jython \
    pypy \
    pypy3 \
    pypy3.7 \
    pypy3.8 \
    black \
    coverage \
    pip \
    pip2 \
    pip3 \
    pycodestyle \
    pylint \
    tox; \
  do \
    echo "##########"; \
    echo "# $bin --version"; \
    $bin --version 2>&1; \
  done
