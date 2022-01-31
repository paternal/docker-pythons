FROM debian
LABEL maintainer "Louis Paternault <spalax@gresille.org>"

# Define download URLS
ARG PYTHON27=https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tar.xz
ARG PYTHON36=https://www.python.org/ftp/python/3.6.15/Python-3.6.15.tar.xz
ARG PYTHON37=https://www.python.org/ftp/python/3.7.12/Python-3.7.12.tar.xz
ARG PYTHON38=https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tar.xz
ARG PYTHON39=https://www.python.org/ftp/python/3.9.10/Python-3.9.10.tar.xz
ARG PYTHON310=https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tar.xz
ARG PYTHON311=https://www.python.org/ftp/python/3.11.0/Python-3.11.0a4.tar.xz
ARG PYPY27=https://downloads.python.org/pypy/pypy2.7-v7.3.6-linux64.tar.bz2
ARG PYPY37=https://downloads.python.org/pypy/pypy3.7-v7.3.7-linux64.tar.bz2
ARG PYPY38=https://downloads.python.org/pypy/pypy3.8-v7.3.7-linux64.tar.bz2
ARG JYTHON=https://repo1.maven.org/maven2/org/python/jython-installer/2.7.2/jython-installer-2.7.2.jar

################################################################################
# Install compilation tools

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt update --yes && apt install --yes \
    build-essential \
    gdb \
    lcov \
    libbz2-dev \
    libffi-dev \
    libgdbm-compat-dev \
    libgdbm-dev \
    liblzma-dev \
    libncurses5-dev \
    libnss3-dev \
    libreadline6-dev \
    libsqlite3-dev \
    libssl-dev \
    lzma \
    lzma-dev \
    pkg-config \
    tk-dev \
    uuid-dev \
    wget \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

################################################################################
# Python

# Python2.7
RUN \
  wget $PYTHON27 \
  && tar -xf Python-*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm Python* -fr \
  && ln -s /usr/local/bin/python2.7 /usr/local/bin/python \
  && ln -s /usr/local/bin/python2.7 /usr/local/bin/python2

# Python3.6
RUN \
  wget $PYTHON36 \
  && tar -xf Python*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python*

# Python3.7
RUN \
  wget $PYTHON37 \
  && tar -xf Python*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python*

# Python3.8
RUN \
  wget $PYTHON38 \
  && tar -xf Python*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python*

# Python3.9
RUN \
  wget $PYTHON39 \
  && tar -xf Python*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python*

# Python3.11
RUN \
  wget $PYTHON311 \
  && tar -xf Python*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python*

# Python3.10
# The "stable" Python version is installed last, so that some of its tools are not replaced by non-stable ones.
RUN \
  wget $PYTHON310 \
  && tar -xf Python*.tar.xz \
  && cd Python-* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  # Python3.10 is the stable Python version, hence `make install` instead of `make altinstall`. \
  && make install \
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
  wget $PYPY27 \
  && tar -xf pypy*bz2 \
  && rm pypy*bz2 \
  && mv pypy* /opt

# Pypy3.7
RUN \
  wget $PYPY37 \
  && tar -xf pypy*bz2 \
  && rm pypy*bz2 \
  && mv pypy* /opt

# Pypy3.8
RUN \
  wget $PYPY38 \
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
  apt update --yes && apt install --yes openjdk-17-jre \
  && rm -rf /var/lib/apt/lists/* \
  && wget $JYTHON \
  && java -jar jython-installer*.jar --silent --type standard --directory /opt/jython \
  && rm jython-installer*.jar \
  && ln -s /opt/jython/bin/jython /usr/local/bin/

################################################################################
# Install pip3 packages

RUN python3 -m pip install \
  black \
  coverage \
  pycodestyle \
  pylint \
  tox

################################################################################
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
