FROM debian:jessie
RUN echo 'APT::Default-Release "jessie";' >  /etc/apt/apt.conf.d/99default-release
RUN echo 'deb http://httpredir.debian.org/debian stretch main' > /etc/apt/sources.list.d/stretch.list
RUN echo 'deb http://httpredir.debian.org/debian experimental main' > /etc/apt/sources.list.d/experimental.list
RUN \
  apt-get -y update && \
  apt-get install -y python && \
  apt-get install -y -t jessie python3.4 && \
  apt-get install -y -t stretch python python3.5 && \
  apt-get install -y -t experimental python3.6
RUN python --version; python3.4 --version; python3.5 --version; python3.6 --version
