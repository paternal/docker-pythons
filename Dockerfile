FROM debian:jessie
RUN echo 'APT::Default-Release "jessie";' >  /etc/apt/apt.conf.d/99default-release
RUN echo 'deb http://httpredir.debian.org/debian stretch main' > /etc/apt/sources.list.d/stretch.list
RUN echo 'deb http://httpredir.debian.org/debian experimental main' > /etc/apt/sources.list.d/experimental.list
RUN \
  apt-get -y update && \
  apt-get install -y python python-pip python-dev && \
  apt-get install -y python3 python3-dev && \
  apt-get install -y -t jessie python3.4 python3.4-dev && \
  apt-get install -y -t stretch python3.5 python3.5-dev && \
  apt-get install -y -t experimental python3.6 python3.6-dev && \
  apt-get clean
RUN pip install --upgrade pip setuptools wheel
RUN pip install tox

RUN python --version; python3.4 --version; python3.5 --version; python3.6 --version
RUN pip --version
RUN tox --version
