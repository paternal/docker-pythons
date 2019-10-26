FROM debian:jessie
LABEL maintainer "Louis Paternault <spalax+docker@gresille.org>"

ARG DEBIAN_FRONTEND=noninteractive
RUN echo 'APT::Default-Release "jessie";' >  /etc/apt/apt.conf.d/99default-release
#RUN echo 'Acquire::http::proxy "http://192.168.0.34:3142";' > /etc/apt/apt.conf.d/02proxy # TODO Comment this line
#RUN echo 'deb http://httpredir.debian.org/debian buster main' > /etc/apt/sources.list.d/buster.list
RUN echo 'deb http://httpredir.debian.org/debian stretch main' > /etc/apt/sources.list.d/stretch.list
#RUN echo 'deb http://httpredir.debian.org/debian sid main' > /etc/apt/sources.list.d/sid.list


RUN \
  apt-get --yes update \
  && \
  apt-get install --yes  \
      jython \
      pypy \
      python \
      python-dev \
      python-pip \
      python2.7 \
      python2.7-dev \
      python3 \
      python3-dev \
      python3-pip \
      python3.4 \
      python3.4-dev \
      && \
  #apt-get install --yes --target-release buster \
  #    pypy3 \
  #    python2 \
  #    python2-dev \
  #    python3.7 \
  #    python3.7-dev \
  #    && \
  apt-get install --yes --target-release stretch \
      python3.5 \
      python3.5-dev \
      && \
  #apt-get install --yes --target-release sid \
  #    python3.8 \
  #    python3.8-dev \
  #    && \
  apt-get clean
RUN python3.5 -m pip install tox

# Print versions
RUN for bin in jython pip pip3 pypy python python2 python2.7 python3 python3.4 python3.5 tox; \
    do \
      echo "$bin $($bin --version 2>&1)"; \
    done
