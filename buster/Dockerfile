FROM debian:buster
LABEL maintainer "Louis Paternault <spalax@gresille.org>"

ARG DEBIAN_FRONTEND=noninteractive
RUN echo 'APT::Default-Release "buster";' >  /etc/apt/apt.conf.d/99default-release
#RUN echo 'Acquire::http::proxy "http://192.168.0.34:3142";' > /etc/apt/apt.conf.d/02proxy # TODO Comment this line
RUN echo 'deb http://httpredir.debian.org/debian stretch main' > /etc/apt/sources.list.d/stretch.list
RUN echo 'deb http://httpredir.debian.org/debian bullseye main' > /etc/apt/sources.list.d/bullseye.list


RUN \
  apt update --yes \
  && \
  apt install --yes  \
      cython \
      cython3 \
      jython \
      pypy \
      pypy-tk \
      pypy3 \
      pypy3-tk \
      python \
      python-pip \
      python-tk \
      python2 \
      python2.7 \
      python3 \
      python3-dev \
      python3-distutils \
      python3-pip \
      python3-tk \
      python3.7 \
      python3.7-dev \
      && \
  apt install --yes --target-release bullseye \
      python3.9 \
      python3.9-dev \
      && \
  apt-get clean
RUN python3 -m pip install --upgrade pip setuptools # Workaround for pylint to be installed
RUN python3 -m pip install \
  black \
  coverage \
  pycodestyle \
  pylint \
  tox

# Print versions
RUN for bin in black coverage cython cython3 jython pip pip3 pycodestyle pylint pypy pypy3 python python2 python2.7 python3 python3.7 python3.9 tox; \
    do \
      echo "$bin $($bin --version 2>&1)"; \
    done
