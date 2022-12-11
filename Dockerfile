FROM debian
LABEL maintainer "Louis Paternault <spalax@gresille.org>"

# Define download URLS
# Python https://www.python.org/downloads/source/
ARG PYTHON27=https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tar.xz
ARG PYTHON36=https://www.python.org/ftp/python/3.6.15/Python-3.6.15.tar.xz
ARG PYTHON37=https://www.python.org/ftp/python/3.7.16/Python-3.7.16.tar.xz
ARG PYTHON38=https://www.python.org/ftp/python/3.8.16/Python-3.8.16.tar.xz
ARG PYTHON39=https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tar.xz
ARG PYTHON310=https://www.python.org/ftp/python/3.10.9/Python-3.10.9.tar.xz
ARG PYTHON311=https://www.python.org/ftp/python/3.11.1/Python-3.11.1.tar.xz
ARG PYTHON312=https://www.python.org/ftp/python/3.12.0/Python-3.12.0a3.tar.xz
# Pypy https://www.pypy.org/download.html
ARG PYPY27=https://downloads.python.org/pypy/pypy2.7-v7.3.10-linux64.tar.bz2
ARG PYPY37=https://downloads.python.org/pypy/pypy3.7-v7.3.9-linux64.tar.bz2
ARG PYPY38=https://downloads.python.org/pypy/pypy3.8-v7.3.10-linux64.tar.bz2
ARG PYPY39=https://downloads.python.org/pypy/pypy3.9-v7.3.10-linux64.tar.bz2
# Jython https://www.jython.org/download
ARG JYTHON=https://repo1.maven.org/maven2/org/python/jython-installer/2.7.3/jython-installer-2.7.3.jar

# Packages installed for every python version
ARG PACKAGES="pip wheel setuptools"

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
  cd ~ \
  && wget $PYTHON27 \
  && tar -xf Python*.tar.xz \
  && cd Python* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm Python* -fr \
  && ln -s /usr/local/bin/python2.7 /usr/local/bin/python \
  && ln -s /usr/local/bin/python2.7 /usr/local/bin/python2 \
  && python2.7 -m ensurepip \
  && python2.7 -m pip install -U $PACKAGES

# Python3.6
RUN \
  cd ~ \
  && wget $PYTHON36 \
  && tar -xf Python*.tar.xz \
  && cd Python* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python* \
  && python3.6 -m ensurepip \
  && python3.6 -m pip install -U $PACKAGES

# Python3.7
RUN \
  cd ~ \
  && wget $PYTHON37 \
  && tar -xf Python*.tar.xz \
  && cd Python* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python* \
  && python3.7 -m ensurepip \
  && python3.7 -m pip install -U $PACKAGES

# Python3.8
RUN \
  cd ~ \
  && wget $PYTHON38 \
  && tar -xf Python*.tar.xz \
  && cd Python* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python* \
  && python3.8 -m ensurepip \
  && python3.8 -m pip install -U $PACKAGES

# Python3.9
RUN \
  cd ~ \
  && wget $PYTHON39 \
  && tar -xf Python*.tar.xz \
  && cd Python* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python* \
  && python3.9 -m ensurepip \
  && python3.9 -m pip install -U $PACKAGES

# Python3.10
RUN \
  cd ~ \
  && wget $PYTHON310 \
  && tar -xf Python*.tar.xz \
  && cd Python* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python* \
  && python3.10 -m ensurepip \
  && python3.10 -m pip install -U $PACKAGES

# Python3.12
RUN \
  cd ~ \
  && wget $PYTHON312 \
  && tar -xf Python*.tar.xz \
  && cd Python* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python* \
  && python3.12 -m ensurepip \
  && python3.12 -m pip install -U $PACKAGES

# The "stable" Python version is installed last, so that some of its tools are not replaced by non-stable ones.
# Python3.11
RUN \
  cd ~ \
  && wget $PYTHON311 \
  && tar -xf Python*.tar.xz \
  && cd Python* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  # This is the stable Python version, hence `make install` instead of `make altinstall`. \
  && make install \
  && cd .. \
  && rm -fr Python* \
  && python3.11 -m ensurepip \
  && python3.11 -m pip install -U $PACKAGES


################################################################################
# Pypy

# Pypy2.7
RUN \
  cd ~ \
  && wget $PYPY27 \
  && tar -xf pypy*bz2 \
  && rm pypy*bz2 \
  && mv pypy* /opt

# Pypy3.7
RUN \
  cd ~ \
  && wget $PYPY37 \
  && tar -xf pypy*bz2 \
  && rm pypy*bz2 \
  && mv pypy* /opt

# Pypy3.8
RUN \
  cd ~ \
  && wget $PYPY38 \
  && tar -xf pypy*bz2 \
  && rm pypy*bz2 \
  && mv pypy* /opt

# Pypy3.9
RUN \
  cd ~ \
  && wget $PYPY39 \
  && tar -xf pypy*bz2 \
  && rm pypy*bz2 \
  && mv pypy* /opt

# Pypy symlinks
RUN \
  for version in 3.7 3.8 3.9; \
  do \
    ln -s /opt/pypy${version}*/bin/pypy${version} /usr/local/bin; \
    pypy${version} -m ensurepip; \
    pypy${version} -m pip install -U pip setuptools; \
  done; \
  ln -s /usr/local/bin/pypy3.9 /usr/local/bin/pypy3

RUN \
  ln -s /opt/pypy2.7*/bin/pypy /usr/local/bin \
  && pypy -m ensurepip \
  && pypy -m pip install -U pip setuptools

################################################################################
# Jython
RUN \
  apt update --yes && apt install --yes openjdk-17-jre \
  && rm -rf /var/lib/apt/lists/* \
  && cd ~ \
  && wget $JYTHON \
  && java -jar jython-installer*.jar --silent --type standard --directory /opt/jython \
  && rm jython-installer*.jar \
  && ln -s /opt/jython/bin/jython /usr/local/bin/

################################################################################
# Install python3 packages

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
    pypy3.9 \
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
