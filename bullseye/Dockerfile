FROM debian:bullseye
LABEL maintainer "Louis Paternault <spalax+docker@gresille.org>"

ARG DEBIAN_FRONTEND=noninteractive
RUN echo 'APT::Default-Release "bullseye";' >  /etc/apt/apt.conf.d/99default-release
#RUN echo 'Acquire::http::proxy "http://192.168.0.34:3142";' > /etc/apt/apt.conf.d/02proxy # TODO Comment this line
RUN echo 'deb http://httpredir.debian.org/debian jessie main' > /etc/apt/sources.list.d/jessie.list
RUN echo 'deb http://httpredir.debian.org/debian stretch main' > /etc/apt/sources.list.d/stretch.list
RUN echo 'deb http://httpredir.debian.org/debian buster main' > /etc/apt/sources.list.d/buster.list
RUN echo 'deb http://httpredir.debian.org/debian sid main' > /etc/apt/sources.list.d/sid.list


RUN \
  apt update --yes \
  && \
  apt install --yes  \
      jython \
      pypy \
      pypy-tk \
      pypy3 \
      pypy3-tk \
      python \
      python-dev \
      python-pip-whl \
      python-tk \
      python2 \
      python2-dev \
      python2.7 \
      python2.7-dev \
      python3 \
      python3-dev \
      python3-pip \
      python3-tk \
      python3.8 \
      python3.8-dev \
  && \
  apt install --yes \
      python3.5 \
      python3.5-dev \
  && \
  apt install --yes --target-release sid \
      python3.9 \
      python3.9-dev \
  && \
  apt clean
RUN python3 -m pip install \
  black \
  coverage \
  pycodestyle \
  pylint \
  tox

# Print versions
RUN for bin in black coverage jython pycodestyle pip pip3 pylint pypy pypy3 python python2 python2.7 python3 python3.5 python3.8 python3.9 tox; \
    do \
      echo "$bin $($bin --version 2>&1)"; \
    done
