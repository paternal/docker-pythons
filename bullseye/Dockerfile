FROM debian:bullseye
LABEL maintainer "Louis Paternault <spalax+docker@gresille.org>"

ARG DEBIAN_FRONTEND=noninteractive
RUN echo 'APT::Default-Release "bullseye";' >  /etc/apt/apt.conf.d/99default-release
#RUN echo 'Acquire::http::proxy "http://192.168.0.34:3142";' > /etc/apt/apt.conf.d/02proxy # TODO Comment this line
RUN echo 'deb http://httpredir.debian.org/debian stretch main' > /etc/apt/sources.list.d/stretch.list
RUN echo 'deb http://httpredir.debian.org/debian sid main' > /etc/apt/sources.list.d/sid.list


RUN \
  apt-get --yes update \
  && \
  apt-get install --yes  \
      jython \
      pypy \
      pypy3 \
      python \
      python-dev \
      python-pip \
      python2 \
      python2-dev \
      python2.7 \
      python2.7-dev \
      python3 \
      python3-dev \
      python3-pip \
      python3.5 \
      python3.5-dev \
      python3.7 \
      python3.7-dev \
      python3.8 \
      python3.8-dev \
      && \
  apt-get clean
RUN pip install tox

# Print versions
RUN for bin in jython pip pip3 pypy pypy3 python python2 python2.7 python3 python3.5 python3.7 python3.8 tox; \
    do \
      echo "$bin $($bin --version 2>&1)"; \
    done
