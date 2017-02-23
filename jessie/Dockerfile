FROM debian:jessie
RUN echo 'APT::Default-Release "jessie";' >  /etc/apt/apt.conf.d/99default-release
RUN echo 'deb http://httpredir.debian.org/debian stretch main' > /etc/apt/sources.list.d/stretch.list
RUN echo 'deb http://httpredir.debian.org/debian experimental main' > /etc/apt/sources.list.d/experimental.list
RUN \
  apt-get --yes update && \
  apt-get install --yes python python-pip python-dev && \
  apt-get install --yes python3 python3-dev && \
  apt-get install --yes pypy pypy-dev && \
  apt-get install --yes jython && \
  apt-get install --yes --target-release jessie python3.4 python3.4-dev && \
  apt-get install --yes --target-release stretch python3.5 python3.5-dev && \
  apt-get install --yes --target-release experimental python3.6 python3.6-dev && \
  apt-get clean
RUN pip install tox

# Print versions
RUN for bin in python python2.7 python3 python3.4 python3.5 python3.6 pypy jython tox; \
    do \
      echo "$bin $($bin --version)"; \
    done
