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
    - [pypy](https://packages.debian.org/jessie/pypy)
    - [python](https://packages.debian.org/jessie/python)
    - [python-dev](https://packages.debian.org/jessie/python-dev)
    - [python-pip](https://packages.debian.org/jessie/python-pip)
    - [python2.7](https://packages.debian.org/jessie/python2.7)
    - [python2.7-dev](https://packages.debian.org/jessie/python2.7-dev)
    - [python3](https://packages.debian.org/jessie/python3)
    - [python3-dev](https://packages.debian.org/jessie/python3-dev)
    - [python3-pip](https://packages.debian.org/jessie/python3-pip)
    - [python3.4-dev](https://packages.debian.org/jessie/python3.4-dev)
    - [python3.4](https://packages.debian.org/jessie/python3.4)
    - [python3.5](https://packages.debian.org/stretch/python3.5)
    - [python3.5-dev](https://packages.debian.org/stretch/python3.5-dev)

- Some essential (to my taste) python packages are installed using pip:
    - [tox](https://pypi.python.org/pypi/tox)


## Tag `stretch`

Based on a [debian stretch](https://www.debian.org/releases/stretch/).

- Most of the python versions packaged for debian are available, that is:
    - [jython](https://packages.debian.org/stretch/jython)
    - [pypy](https://packages.debian.org/stretch/pypy)
    - [pypy3](https://packages.debian.org/buster/pypy3)
    - [python](https://packages.debian.org/stretch/python)
    - [python-dev](https://packages.debian.org/stretch/python-dev)
    - [python-pip](https://packages.debian.org/stretch/python-pip)
    - [python2](https://packages.debian.org/buster/python2)
    - [python2-dev](https://packages.debian.org/buster/python2-dev)
    - [python2.7](https://packages.debian.org/stretch/python2.7)
    - [python2.7-dev](https://packages.debian.org/stretch/python2.7-dev)
    - [python3](https://packages.debian.org/stretch/python3)
    - [python3-dev](https://packages.debian.org/stretch/python3-dev)
    - [python3-pip](https://packages.debian.org/stretch/python3-pip)
    - [python3.5](https://packages.debian.org/stretch/python3.5)
    - [python3.5-dev](https://packages.debian.org/stretch/python3.5-dev)
    - [python3.7](https://packages.debian.org/buster/python3.7)
    - [python3.7-dev](https://packages.debian.org/buster/python3.7-dev)
    - [python3.8](https://packages.debian.org/sid/python3.8)
    - [python3.8-dev](https://packages.debian.org/sid/python3.8-dev)

- Some essential (to my taste) python packages are installed using pip:
    - [tox](https://pypi.python.org/pypi/tox)


## Tag `buster`

Based on a [debian buster](https://www.debian.org/releases/buster/).

- Most of the python versions packaged for debian are available, that is:
    - [jython](https://packages.debian.org/buster/jython)
    - [pypy](https://packages.debian.org/buster/pypy)
    - [pypy3](https://packages.debian.org/buster/pypy3)
    - [python](https://packages.debian.org/buster/python)
    - [python-dev](https://packages.debian.org/buster/python-dev)
    - [python-pip](https://packages.debian.org/buster/python-pip)
    - [python2](https://packages.debian.org/buster/python2)
    - [python2-dev](https://packages.debian.org/buster/python2-dev)
    - [python2.7](https://packages.debian.org/buster/python2.7)
    - [python2.7-dev](https://packages.debian.org/buster/python2.7-dev)
    - [python3](https://packages.debian.org/buster/python3)
    - [python3-dev](https://packages.debian.org/buster/python3-dev)
    - [python3-pip](https://packages.debian.org/buster/python3-pip)
    - [python3.5](https://packages.debian.org/stretch/python3.5)
    - [python3.5-dev](https://packages.debian.org/stretch/python3.5-dev)
    - [python3.7](https://packages.debian.org/buster/python3.7)
    - [python3.7-dev](https://packages.debian.org/buster/python3.7-dev)
    - [python3.8](https://packages.debian.org/sid/python3.8)
    - [python3.8-dev](https://packages.debian.org/sid/python3.8-dev)

- Some essential (to my taste) python packages are installed using pip:
    - [tox](https://pypi.python.org/pypi/tox)


## Tag `bullseye`

Based on a [debian bullseye](https://www.debian.org/releases/bullseye/).

- Most of the python versions packaged for debian are available, that is:
    - [jython](https://packages.debian.org/bullseye/jython)
    - [pypy](https://packages.debian.org/bullseye/pypy)
    - [pypy3](https://packages.debian.org/bullseye/pypy3)
    - [python](https://packages.debian.org/bullseye/python)
    - [python-dev](https://packages.debian.org/bullseye/python-dev)
    - [python-pip](https://packages.debian.org/bullseye/python-pip)
    - [python2](https://packages.debian.org/bullseye/python2)
    - [python2-dev](https://packages.debian.org/bullseye/python2-dev)
    - [python2.7](https://packages.debian.org/bullseye/python2.7)
    - [python2.7-dev](https://packages.debian.org/bullseye/python2.7-dev)
    - [python3](https://packages.debian.org/bullseye/python3)
    - [python3-dev](https://packages.debian.org/bullseye/python3-dev)
    - [python3-pip](https://packages.debian.org/bullseye/python3-pip)
    - [python3.5](https://packages.debian.org/stretch/python3.5)
    - [python3.5-dev](https://packages.debian.org/stretch/python3.5-dev)
    - [python3.7](https://packages.debian.org/bullseye/python3.7)
    - [python3.7-dev](https://packages.debian.org/bullseye/python3.7-dev)
    - [python3.8](https://packages.debian.org/sid/python3.8)
    - [python3.8-dev](https://packages.debian.org/sid/python3.8-dev)

- Some essential (to my taste) python packages are installed using pip:
    - [tox](https://pypi.python.org/pypi/tox)



## Usage

    sudo docker pull paternal/pythons
    sudo docker run -i -t paternal/pythons /bin/bash
