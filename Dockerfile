FROM debian:jessie
RUN echo 'APT::Default-Release "jessie";' >  /etc/apt/apt.conf.d/99default-release
RUN echo 'deb http://httpredir.debian.org/debian stretch main' > /etc/apt/sources.list.d/stretch.list
RUN echo 'deb http://httpredir.debian.org/debian experimental main' > /etc/apt/sources.list.d/experimental.list
RUN \
  apt-get -y update && \
  apt-get install -y python python-pip && \
  apt-get install -y -t jessie python3.4 && \
  apt-get install -y -t stretch python3.5 && \
  apt-get install -y -t experimental python3.6
RUN pip install --upgrade pip
RUN pip install tox

RUN python --version; python3.4 --version; python3.5 --version; python3.6 --version
RUN pip --version
RUN tox --version
