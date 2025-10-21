FROM debian
LABEL maintainer "Louis Paternault <spalax@gresille.org>"

# Define download URLS
# Python https://www.python.org/downloads/source/
ARG PYTHON27=https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tar.xz
ARG PYTHON37=https://www.python.org/ftp/python/3.7.17/Python-3.7.17.tar.xz
ARG PYTHON38=https://www.python.org/ftp/python/3.8.20/Python-3.8.20.tar.xz
ARG PYTHON39=https://www.python.org/ftp/python/3.9.24/Python-3.9.24.tar.xz
ARG PYTHON310=https://www.python.org/ftp/python/3.10.19/Python-3.10.19.tar.xz
ARG PYTHON311=https://www.python.org/ftp/python/3.11.14/Python-3.11.14.tar.xz
ARG PYTHON312=https://www.python.org/ftp/python/3.12.12/Python-3.12.12.tar.xz
ARG PYTHON313=https://www.python.org/ftp/python/3.13.8/Python-3.13.8.tar.xz
ARG PYTHON314=https://www.python.org/ftp/python/3.14.0/Python-3.14.0.tar.xz
ARG PYTHON315=https://www.python.org/ftp/python/3.15.0/Python-3.15.0a1.tar.xz
# Pypy https://www.pypy.org/download.html
ARG PYPY27=https://downloads.python.org/pypy/pypy2.7-v7.3.20-linux64.tar.bz2
ARG PYPY37=https://downloads.python.org/pypy/pypy3.7-v7.3.9-linux64.tar.bz2
ARG PYPY38=https://downloads.python.org/pypy/pypy3.8-v7.3.11-linux64.tar.bz2
ARG PYPY39=https://downloads.python.org/pypy/pypy3.9-v7.3.16-linux64.tar.bz2
ARG PYPY310=https://downloads.python.org/pypy/pypy3.10-v7.3.19-linux64.tar.bz2
ARG PYPY311=https://downloads.python.org/pypy/pypy3.11-v7.3.20-linux64.tar.bz2
# Jython https://www.jython.org/download
ARG JYTHON=https://repo1.maven.org/maven2/org/python/jython-installer/2.7.4/jython-installer-2.7.4.jar
# Micropython
ARG MICROPYTHON=https://micropython.org/resources/source/micropython-1.26.1.tar.xz

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
    libncurses5-dev \
    libnss3-dev \
    libreadline6-dev \
    libsqlite3-dev \
    libssl-dev \
    lzma \
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

# Python3.11
RUN \
  cd ~ \
  && wget $PYTHON311 \
  && tar -xf Python*.tar.xz \
  && cd Python* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python* \
  && python3.11 -m ensurepip \
  && python3.11 -m pip install -U $PACKAGES

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

# Python3.13
RUN \
  cd ~ \
  && wget $PYTHON313 \
  && tar -xf Python*.tar.xz \
  && cd Python* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python* \
  && python3.13 -m ensurepip \
  && python3.13 -m pip install -U $PACKAGES

# Python3.15
RUN \
  cd ~ \
  && wget $PYTHON315 \
  && tar -xf Python*.tar.xz \
  && cd Python* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  && make altinstall \
  && cd .. \
  && rm -fr Python* \
  && python3.15 -m ensurepip \
  && python3.15 -m pip install -U $PACKAGES

# The "stable" Python version is installed last, so that some of its tools are not replaced by non-stable ones.
# Python3.14
RUN \
  cd ~ \
  && wget $PYTHON314 \
  && tar -xf Python*.tar.xz \
  && cd Python* \
  && ./configure --enable-optimizations --prefix=/usr/local \
  && make \
  # This is the stable Python version, hence `make install` instead of `make altinstall`. \
  && make install \
  && cd .. \
  && rm -fr Python* \
  && python3.14 -m ensurepip \
  && python3.14 -m pip install -U $PACKAGES


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

# Pypy3.10
RUN \
  cd ~ \
  && wget $PYPY310 \
  && tar -xf pypy*bz2 \
  && rm pypy*bz2 \
  && mv pypy* /opt

# Pypy3.11
RUN \
  cd ~ \
  && wget $PYPY311 \
  && tar -xf pypy*bz2 \
  && rm pypy*bz2 \
  && mv pypy* /opt

# Pypy symlinks
RUN \
  for version in 3.7 3.8 3.9 3.10 3.11; \
  do \
    ln -s /opt/pypy${version}*/bin/pypy${version} /usr/local/bin; \
    pypy${version} -m ensurepip; \
    pypy${version} -m pip install -U pip setuptools; \
  done; \
  ln -s /usr/local/bin/pypy3.11 /usr/local/bin/pypy3

RUN \
     ln -s /opt/pypy2.7*/bin/pypy /usr/local/bin \
  && ln -s /opt/pypy2.7*/bin/pypy2 /usr/local/bin \
  && ln -s /opt/pypy2.7*/bin/pypy2.7 /usr/local/bin \
  && pypy -m ensurepip \
  && pypy -m pip install -U pip setuptools

################################################################################
# Jython
RUN \
  apt update --yes && apt install --yes default-jre \
  && rm -rf /var/lib/apt/lists/* \
  && cd ~ \
  && wget $JYTHON \
  && java -jar jython-installer*.jar --silent --type standard --directory /opt/jython \
  && rm jython-installer*.jar \
  && ln -s /opt/jython/bin/jython /usr/local/bin/

################################################################################
# Micropython
RUN \
  cd ~ \
  && wget $MICROPYTHON \
  && tar -xf micropython*.tar.xz \
  && rm micropython*.tar.xz \
  && cd micropython*/ports/unix \
  && make \
  && make install

################################################################################
# More python implementations
RUN python3 -m pip install \
  cython \
  nuitka \
  numba

################################################################################
# Install python3 packages

# When PEP 668 strikes, use `pip install --break-system-packages`
# https://peps.python.org/pep-0668/
# This should not be necessary:
# https://pythonspeed.com/articles/externally-managed-environment-pep-668/
RUN python3 -m pip install \
  black \
  build \
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
    python3.7 \
    python3.8 \
    python3.9 \
    python3.10 \
    python3.11 \
    python3.12 \
    python3.13 \
    python3.14 \
    jython \
    pypy \
    pypy2 \
    pypy2.7 \
    pypy3 \
    pypy3.7 \
    pypy3.8 \
    pypy3.9 \
    pypy3.10 \
    pypy3.11 \
    cython \
    nuitka \
    numba \
    micropython \
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
