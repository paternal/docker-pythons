paternal/pythons
================

![Docker Stars](https://badgen.net/docker/stars/paternal/pythons?icon=docker&label=stars)
![Docker Pulls](https://badgen.net/docker/pulls/paternal/pythons?icon=docker&label=pulls)

A docker image with several python versions, and associated python tools.

Note than when installing recent python versions on old debian versions, other packages are also pulled from this newer debian version. So, althought the system you get is based on a given debian version, it can contain packages (including *core* packages like binutils or libc6) from several debian versions.

## Tag `latest`

The default `latest` tag is equivalent to the `stable` debian version (that is, `buster`).

## Tag `jessie`

Based on a [debian jessie](https://www.debian.org/releases/jessie/).

- Most of the python versions packaged for debian are available, that is:
    - [jython](https://packages.debian.org/jessie/jython)
    - [pypy-tk](https://packages.debian.org/jessie/pypy-tk)
    - [pypy](https://packages.debian.org/jessie/pypy)
    - [python-dev](https://packages.debian.org/jessie/python-dev)
    - [python-pip](https://packages.debian.org/jessie/python-pip)
    - [python-tk](https://packages.debian.org/jessie/python-tk)
    - [python2.7-dev](https://packages.debian.org/jessie/python2.7-dev)
    - [python2.7](https://packages.debian.org/jessie/python2.7)
    - [python3-dev](https://packages.debian.org/jessie/python3-dev)
    - [python3-pip](https://packages.debian.org/jessie/python3-pip)
    - [python3-tk](https://packages.debian.org/jessie/python3-tk)
    - [python3.4-dev](https://packages.debian.org/jessie/python3.4-dev)
    - [python3.4](https://packages.debian.org/jessie/python3.4)
    - [python3.5-dev](https://packages.debian.org/stretch/python3.5-dev)
    - [python3.5](https://packages.debian.org/stretch/python3.5)
    - [python3](https://packages.debian.org/jessie/python3)
    - [python](https://packages.debian.org/jessie/python)

- Some essential (to my taste) python packages are installed using pip:
    - [tox](https://pypi.python.org/pypi/tox)


## Tag `stretch`

Based on a [debian stretch](https://www.debian.org/releases/stretch/).

- Most of the python versions packaged for debian are available, that is:
    - [jython](https://packages.debian.org/stretch/jython)
    - [pypy-tk](https://packages.debian.org/stretch/pypy-tk)
    - [pypy3-tk](https://packages.debian.org/buster/pypy3-tk)
    - [pypy3](https://packages.debian.org/buster/pypy3)
    - [pypy](https://packages.debian.org/stretch/pypy)
    - [python-dev](https://packages.debian.org/stretch/python-dev)
    - [python-pip](https://packages.debian.org/stretch/python-pip)
    - [python-tk](https://packages.debian.org/stretch/python-tk)
    - [python2-dev](https://packages.debian.org/buster/python2-dev)
    - [python2.7-dev](https://packages.debian.org/stretch/python2.7-dev)
    - [python2.7](https://packages.debian.org/stretch/python2.7)
    - [python2](https://packages.debian.org/buster/python2)
    - [python3-dev](https://packages.debian.org/stretch/python3-dev)
    - [python3-pip](https://packages.debian.org/stretch/python3-pip)
    - [python3-tk](https://packages.debian.org/stretch/python3-tk)
    - [python3.5-dev](https://packages.debian.org/stretch/python3.5-dev)
    - [python3.5](https://packages.debian.org/stretch/python3.5)
    - [python3.7-dev](https://packages.debian.org/buster/python3.7-dev)
    - [python3.7](https://packages.debian.org/buster/python3.7)
    - [python3.8-dev](https://packages.debian.org/sid/python3.8-dev)
    - [python3.8](https://packages.debian.org/sid/python3.8)
    - [python3](https://packages.debian.org/stretch/python3)
    - [python](https://packages.debian.org/stretch/python)

- Some essential (to my taste) python packages are installed using pip:
    - [tox](https://pypi.python.org/pypi/tox) (installed both with python2 and python3: use `python2 -m tox` or `python3 -m tox` to choose which version to use).


## Tag `buster`

Based on a [debian buster](https://www.debian.org/releases/buster/).

- Most of the python versions packaged for debian are available, that is:
    - [jython](https://packages.debian.org/buster/jython)
    - [pypy-tk](https://packages.debian.org/buster/pypy-tk)
    - [pypy3-tk](https://packages.debian.org/buster/pypy3-tk)
    - [pypy3](https://packages.debian.org/buster/pypy3)
    - [pypy](https://packages.debian.org/buster/pypy)
    - [python-dev](https://packages.debian.org/buster/python-dev)
    - [python-pip](https://packages.debian.org/buster/python-pip)
    - [python-tk](https://packages.debian.org/buster/python-tk)
    - [python2-dev](https://packages.debian.org/buster/python2-dev)
    - [python2.7-dev](https://packages.debian.org/buster/python2.7-dev)
    - [python2.7](https://packages.debian.org/buster/python2.7)
    - [python2](https://packages.debian.org/buster/python2)
    - [python3-dev](https://packages.debian.org/buster/python3-dev)
    - [python3-pip](https://packages.debian.org/buster/python3-pip)
    - [python3-tk](https://packages.debian.org/buster/python3-tk)
    - [python3.5-dev](https://packages.debian.org/stretch/python3.5-dev)
    - [python3.5](https://packages.debian.org/stretch/python3.5)
    - [python3.7-dev](https://packages.debian.org/buster/python3.7-dev)
    - [python3.7](https://packages.debian.org/buster/python3.7)
    - [python3.8-dev](https://packages.debian.org/sid/python3.8-dev)
    - [python3.8](https://packages.debian.org/sid/python3.8)
    - [python3](https://packages.debian.org/buster/python3)
    - [python](https://packages.debian.org/buster/python)

- Some essential (to my taste) python packages are installed using pip:
    - [tox](https://pypi.python.org/pypi/tox) (installed both with python2 and python3: use `python2 -m tox` or `python3 -m tox` to choose which version to use).


## Tag `bullseye`

Based on a [debian bullseye](https://www.debian.org/releases/bullseye/).

This image does not include the [python2 version of `pip`](https://packages.debian.org/jessie/python-pip).

- Most of the python versions packaged for debian are available, that is:
    - [jython](https://packages.debian.org/bullseye/jython)
    - [pypy-tk](https://packages.debian.org/bullseye/pypy-tk)
    - [pypy3-tk](https://packages.debian.org/bullseye/pypy3-tk)
    - [pypy3](https://packages.debian.org/bullseye/pypy3)
    - [pypy](https://packages.debian.org/bullseye/pypy)
    - [python-dev](https://packages.debian.org/bullseye/python-dev)
    - [python-tk](https://packages.debian.org/bullseye/python-tk)
    - [python2-dev](https://packages.debian.org/bullseye/python2-dev)
    - [python2.7-dev](https://packages.debian.org/bullseye/python2.7-dev)
    - [python2.7](https://packages.debian.org/bullseye/python2.7)
    - [python2](https://packages.debian.org/bullseye/python2)
    - [python3-dev](https://packages.debian.org/bullseye/python3-dev)
    - [python3-pip](https://packages.debian.org/bullseye/python3-pip)
    - [python3-tk](https://packages.debian.org/bullseye/python3-tk)
    - [python3.7-dev](https://packages.debian.org/bullseye/python3.7-dev)
    - [python3.7](https://packages.debian.org/bullseye/python3.7)
    - [python3.8-dev](https://packages.debian.org/sid/python3.8-dev)
    - [python3.8](https://packages.debian.org/sid/python3.8)
    - [python3](https://packages.debian.org/bullseye/python3)
    - [python](https://packages.debian.org/bullseye/python)

- Some essential (to my taste) python packages are installed using pip:
    - [tox](https://pypi.python.org/pypi/tox)


## Usage

    sudo docker pull paternal/pythons
    sudo docker run -i -t paternal/pythons /bin/bash
