FROM debian:stretch
LABEL maintainer "Louis Paternault <spalax@gresille.org>"

ARG DEBIAN_FRONTEND=noninteractive

#COPY apt.conf.d/02proxy /etc/apt/apt.conf.d/02proxy
COPY apt.conf.d/99default-release /etc/apt/apt.conf.d/99default-release
COPY preferences /et/apt/preferences
COPY sources.list /etc/apt/sources.list.d/others.list

RUN \
  apt update --yes \
  && \
  apt install --yes  \
      cython3 \
      jython \
      pypy \
      pypy-tk \
      python3 \
      python3-dev \
      python3-pip \
      python3-tk \
      python3.5 \
      python3.5-dev \
      && \
  apt install --yes --target-release buster \
      pypy3 \
      pypy3-tk \
      python3-distutils \
      python3.7 \
      python3.7-dev \
      && \
  apt-get clean

RUN python3 -m pip install -U pip setuptools
RUN python3 -m pip install \
  black \
  coverage \
  pycodestyle \
  pylint \
  tox

# Print versions
RUN for bin in black coverage cython3 jython pip3 pycodestyle pylint pypy pypy3 python3 python3.10 python3.4 python3.5 python3.6 python3.7 python3.8 python3.9 tox; \
    do \
      echo "$bin $($bin --version 2>&1)"; \
    done
