FROM debian:stretch
LABEL maintainer "Louis Paternault <spalax@gresille.org>"

ARG DEBIAN_FRONTEND=noninteractive
RUN echo 'APT::Default-Release "stretch";' >  /etc/apt/apt.conf.d/99default-release
#RUN echo 'Acquire::http::proxy "http://192.168.0.34:3142";' > /etc/apt/apt.conf.d/02proxy # TODO Comment this line
RUN echo 'deb http://httpredir.debian.org/debian buster main' > /etc/apt/sources.list.d/buster.list
RUN echo 'deb http://httpredir.debian.org/debian bullseye main' > /etc/apt/sources.list.d/bullseye.list
RUN echo 'deb http://httpredir.debian.org/debian experimental main' > /etc/apt/sources.list.d/experimental.list


RUN echo 'Package: *' >> /etc/apt/preferences
RUN echo 'Pin: release a=stretch' >> /etc/apt/preferences
RUN echo 'Pin-Priority: 999' >> /etc/apt/preferences

RUN echo >> /etc/apt/preferences
RUN echo 'Package: *' >> /etc/apt/preferences
RUN echo 'Pin: release a=buster' >> /etc/apt/preferences
RUN echo 'Pin-Priority: 989' >> /etc/apt/preferences

RUN echo >> /etc/apt/preferences
RUN echo 'Package: *' >> /etc/apt/preferences
RUN echo 'Pin: release a=bullseye' >> /etc/apt/preferences
RUN echo 'Pin-Priority: 988' >> /etc/apt/preferences

RUN echo >> /etc/apt/preferences
RUN echo 'Package: *' >> /etc/apt/preferences
RUN echo 'Pin: release a=bookworm' >> /etc/apt/preferences
RUN echo 'Pin-Priority: 987' >> /etc/apt/preferences

RUN echo >> /etc/apt/preferences
RUN echo 'Package: *' >> /etc/apt/preferences
RUN echo 'Pin: release a=sid' >> /etc/apt/preferences
RUN echo 'Pin-Priority: 986' >> /etc/apt/preferences

RUN echo >> /etc/apt/preferences
RUN echo 'Package: *' >> /etc/apt/preferences
RUN echo 'Pin: release a=experimental' >> /etc/apt/preferences
RUN echo 'Pin-Priority: 984' >> /etc/apt/preferences


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
