FROM debian:jessie
LABEL maintainer "Louis Paternault <spalax+docker@gresille.org>"

ARG DEBIAN_FRONTEND=noninteractive
RUN echo 'APT::Default-Release "jessie";' >  /etc/apt/apt.conf.d/99default-release
RUN echo 'deb http://httpredir.debian.org/debian stretch main' > /etc/apt/sources.list.d/stretch.list
RUN echo 'deb http://httpredir.debian.org/debian buster main' > /etc/apt/sources.list.d/buster.list
RUN echo 'deb http://httpredir.debian.org/debian sid main' > /etc/apt/sources.list.d/sid.list
RUN \
  apt-get --yes update && \
  apt-get install --yes \
      python \
      python-pip \
      python-dev \
      && \
  apt-get install --yes \
      python3 \
      python3-dev \
      python3-pip \
      python3.4 \
      python3.4-dev \
      && \
  apt-get install --yes \
      pypy \
      pypy-dev \
      && \
  apt-get install --yes \
      jython \
      && \
  apt-get install --yes --target-release stretch \
      libc6-dev \
      python3.5 \
      python3.5-dev \
      && \
  apt-get install --yes --target-release buster \
      python3.7 \
      python3.7-dev \
      && \
  apt-get install --yes --target-release sid \
      #python3.8 \
      #python3.8-dev \
      pypy3 \
      && \
  apt-get clean
RUN pip install tox

# Print versions
RUN for bin in python python2 python2.7 python3 python3.4 python3.5 python3.7 pypy pypy3 jython tox; \
    do \
      echo "$bin $($bin --version 2>&1)"; \
    done
