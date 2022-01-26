paternal/pythons
================

![Docker Stars](https://badgen.net/docker/stars/paternal/pythons?icon=docker&label=stars)
![Docker Pulls](https://badgen.net/docker/pulls/paternal/pythons?icon=docker&label=pulls)

A docker image with several python versions, and associated python tools.

Most of the images use python versions packaged for Debian, excepted the tag `source`, where python binaries has been compiled from source.

Note than when installing recent python versions on old debian versions, other packages are also pulled from this newer debian version. So, althought the system you get is based on a given debian version, it can contain packages (including *core* packages like binutils or libc6) from several debian versions.

Note that the versions of packages listed here are the versions that were explicitely installed, but the actual installed version might differ. For instance, *foo* version X is explicitely installed, but when installing *bar*, *foo* version Y has been pulled as well. So, although *foo* is listed here as version X, version Y is actually installed.

## Tag `latest`

The default `latest` tag is equivalent to the `stable` debian version (that is, `bullseye`).


## Tag `stretch`

Based on a [debian stretch](https://www.debian.org/releases/stretch/).

- Here are the python versions packaged for debian:
    - [cython3](https://packages.debian.org/stretch/cython3)
    - [jython](https://packages.debian.org/stretch/jython)
    - [pypy](https://packages.debian.org/stretch/pypy)
    - [pypy-tk](https://packages.debian.org/stretch/pypy-tk)
    - [pypy3](https://packages.debian.org/buster/pypy3)
    - [pypy3-tk](https://packages.debian.org/buster/pypy3-tk)
    - [python3](https://packages.debian.org/stretch/python3)
    - [python3-dev](https://packages.debian.org/stretch/python3-dev)
    - [python3-distutils](https://packages.debian.org/buster/python3-distutils)
    - [python3-pip](https://packages.debian.org/stretch/python3-pip)
    - [python3-tk](https://packages.debian.org/stretch/python3-tk)
    - [python3.5](https://packages.debian.org/stretch/python3.5)
    - [python3.5-dev](https://packages.debian.org/stretch/python3.5-dev)
    - [python3.7](https://packages.debian.org/buster/python3.7)
    - [python3.7-dev](https://packages.debian.org/buster/python3.7-dev)
    - [python3.9](https://packages.debian.org/bullseye/python3.9)
    - [python3.9-dev](https://packages.debian.org/bullseye/python3.9-dev)
    - [python3.10](https://packages.debian.org/bookworm/python3.10)
    - [python3.10-dev](https://packages.debian.org/bookworm/python3.10-dev)

- Some essential (to my taste) python packages are installed using pip:
    - [black](https://pypi.python.org/pypi/black)
    - [coverage](https://pypi.python.org/pypi/coverage)
    - [pycodestyle](https://pypi.python.org/pypi/pycodestyle)
    - [pylint](https://pypi.python.org/pypi/pylint)
    - [tox](https://pypi.python.org/pypi/tox)


## Tag `buster`

Based on a [debian buster](https://www.debian.org/releases/buster/).

- Here are the python versions packaged for debian:
    - [cython3](https://packages.debian.org/buster/cython3)
    - [jython](https://packages.debian.org/buster/jython)
    - [pypy](https://packages.debian.org/buster/pypy)
    - [pypy-tk](https://packages.debian.org/buster/pypy-tk)
    - [pypy3](https://packages.debian.org/buster/pypy3)
    - [pypy3-tk](https://packages.debian.org/buster/pypy3-tk)
    - [python3](https://packages.debian.org/buster/python3)
    - [python3-dev](https://packages.debian.org/buster/python3-dev)
    - [python3-distutils](https://packages.debian.org/buster/python3-distutils)
    - [python3-pip](https://packages.debian.org/buster/python3-pip)
    - [python3-tk](https://packages.debian.org/buster/python3-tk)
    - [python3.7](https://packages.debian.org/buster/python3.7)
    - [python3.7-dev](https://packages.debian.org/buster/python3.7-dev)

- Some essential (to my taste) python packages are installed using pip:
    - [black](https://pypi.python.org/pypi/black)
    - [coverage](https://pypi.python.org/pypi/coverage)
    - [pycodestyle](https://pypi.python.org/pypi/pycodestyle)
    - [pylint](https://pypi.python.org/pypi/pylint)
    - [tox](https://pypi.python.org/pypi/tox)


## Tag `bullseye`

Based on a [debian bullseye](https://www.debian.org/releases/bullseye/).

- Here are the python versions packaged for debian:
    - [cython3](https://packages.debian.org/bullseye/cython3)
    - [jython](https://packages.debian.org/bullseye/jython)
    - [pypy](https://packages.debian.org/bullseye/pypy)
    - [pypy-tk](https://packages.debian.org/bullseye/pypy-tk)
    - [pypy3](https://packages.debian.org/bullseye/pypy3)
    - [pypy3-tk](https://packages.debian.org/bullseye/pypy3-tk)
    - [python3](https://packages.debian.org/bullseye/python3)
    - [python3-dev](https://packages.debian.org/bullseye/python3-dev)
    - [python3-distutils](https://packages.debian.org/bullseye/python3-distutils)
    - [python3-pip](https://packages.debian.org/bullseye/python3-pip)
    - [python3-tk](https://packages.debian.org/bullseye/python3-tk)
    - [python3.9](https://packages.debian.org/bullseye/python3.9)
    - [python3.9-dev](https://packages.debian.org/bullseye/python3.9-dev)
    - [python3.10](https://packages.debian.org/bookworm/python3.10)
    - [python3.10-dev](https://packages.debian.org/bookworm/python3.10-dev)

- Some essential (to my taste) python packages are installed using pip:
    - [black](https://pypi.python.org/pypi/black)
    - [coverage](https://pypi.python.org/pypi/coverage)
    - [pycodestyle](https://pypi.python.org/pypi/pycodestyle)
    - [pylint](https://pypi.python.org/pypi/pylint)
    - [tox](https://pypi.python.org/pypi/tox)


## Tag `bookworm`

Based on a [debian bookworm](https://www.debian.org/releases/bookworm/).

- Here are the python versions packaged for debian:
    - [cython3](https://packages.debian.org/bookworm/cython3)
    - [jython](https://packages.debian.org/bookworm/jython)
    - [pypy](https://packages.debian.org/bookworm/pypy)
    - [pypy-tk](https://packages.debian.org/bookworm/pypy-tk)
    - [pypy3](https://packages.debian.org/bookworm/pypy3)
    - [pypy3-tk](https://packages.debian.org/bookworm/pypy3-tk)
    - [python3](https://packages.debian.org/bookworm/python3)
    - [python3-dev](https://packages.debian.org/bookworm/python3-dev)
    - [python3-distutils](https://packages.debian.org/bookworm/python3-distutils)
    - [python3-pip](https://packages.debian.org/bookworm/python3-pip)
    - [python3-tk](https://packages.debian.org/bookworm/python3-tk)
    - [python3.9](https://packages.debian.org/bookworm/python3.9)
    - [python3.9-dev](https://packages.debian.org/bookworm/python3.9-dev)
    - [python3.10](https://packages.debian.org/bookworm/python3.10)
    - [python3.10-dev](https://packages.debian.org/bookworm/python3.10-dev)

- Some essential (to my taste) python packages are installed using pip:
    - [black](https://pypi.python.org/pypi/black)
    - [coverage](https://pypi.python.org/pypi/coverage)
    - [pycodestyle](https://pypi.python.org/pypi/pycodestyle)
    - [pylint](https://pypi.python.org/pypi/pylint)
    - [tox](https://pypi.python.org/pypi/tox)


## Tag `source`

Based on a [debian stable](https://www.debian.org/releases/stable/).

- Python binaries have been compiled from source.
  - python2.7.18
  - python3.6.15
  - python3.7.12
  - python3.8.12
  - python3.9.10
  - python3.10.2
  - python3.11.0a4
  - pypy2.7-v7.3.6
  - pypy3.7-v7.3.7
  - pypy3.8-v7.3.7
  - jython-2.7.2

- Some essential (to my taste) python packages are installed using pip:
    - [black](https://pypi.python.org/pypi/black)
    - [coverage](https://pypi.python.org/pypi/coverage)
    - [pycodestyle](https://pypi.python.org/pypi/pycodestyle)
    - [pylint](https://pypi.python.org/pypi/pylint)
    - [tox](https://pypi.python.org/pypi/tox)



## Usage

    sudo docker pull paternal/pythons
    sudo docker run -i -t paternal/pythons /bin/bash
