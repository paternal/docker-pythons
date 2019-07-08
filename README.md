paternal/pythons
================

![Docker Stars](https://badgen.net/docker/stars/paternal/pythons?icon=docker&label=stars)
![Docker Pulls](https://badgen.net/docker/pulls/paternal/pythons?icon=docker&label=pulls)

A docker image with several python versions, and associated python tools.

## Tag `latest`: Available tools

This list describes the version available with the (default) `latest` tag (equivalent to `buster`).

- It is based on a [debian buster](https://www.debian.org/releases/buster/) (the stable version), and is updated without notice when a new debian version is released.
- Most of the python versions packaged for debian are available, that is:
  - [python](https://packages.debian.org/buster/python) (an alias to `python2.7` — see below);
  - [python2](https://packages.debian.org/buster/python2) (an alias to `python2.7` — see below);
  - [python2.7](https://packages.debian.org/buster/python2.7);
  - [python3](https://packages.debian.org/buster/python3) (an alias to `python3.7` — see below);
  - [python3.5](https://packages.debian.org/stretch/python3.5);
  - [python3.7](https://packages.debian.org/buster/python3.7);
  - [python3.8](https://packages.debian.org/sid/python3.8);
  - [jython](https://packages.debian.org/buster/jython);
  - [pypy](https://packages.debian.org/buster/pypy);
  - [pypy3](https://packages.debian.org/buster/pypy3);
  - [pip](https://pypi.python.org/pypi/pip) (both for [python2](https://packages.debian.org/buster/python-pip) and [python3](https://packages.debian.org/buster/python3-pip)).
- Some essential (to my taste) python packages are installed using pip:
  - [tox](https://pypi.python.org/pypi/tox).

## Other tags

Note than when installing recent python versions on old debian versions (e.g. python3.7 on debian jessie), other packages are also pulled from this newer debian version. So, althought the system you get is based on a given debian version, it can contain packages (including *core* packages like binutils or libc6) from several debian versions.

- `latest`: See above.
- `jessie`: A debian jessie with:
  - [python2.7](https://packages.debian.org/jessie/python2.7);
  - [python3.5](https://packages.debian.org/stretch/python3.5);
  - [python3.7](https://packages.debian.org/buster/python3.7);
  - [python3.8](https://packages.debian.org/bullseye/python3.8);
  - [jython](https://packages.debian.org/jessie/jython);
  - [pypy](https://packages.debian.org/jessie/pypy).
  - [pypy3](https://packages.debian.org/buster/pypy3).
- `stretch`: A debian stretch with:
  - [python2.7](https://packages.debian.org/stretch/python2.7);
  - [python3.5](https://packages.debian.org/stretch/python3.5);
  - [python3.7](https://packages.debian.org/buster/python3.7);
  - [python3.8](https://packages.debian.org/bullseye/python3.8);
  - [jython](https://packages.debian.org/stretch/jython);
  - [pypy](https://packages.debian.org/stretch/pypy).
- `buster` (equivalent to `latest`): A debian buster with:
  - [python2.7](https://packages.debian.org/buster/python2.7);
  - [python3.5](https://packages.debian.org/stretch/python3.5);
  - [python3.7](https://packages.debian.org/buster/python3.7);
  - [python3.8](https://packages.debian.org/bullseye/python3.8);
  - [jython](https://packages.debian.org/buster/jython);
  - [pypy](https://packages.debian.org/buster/pypy).
  - [pypy3](https://packages.debian.org/buster/pypy3).
- `bullseye`: A debian bullseye with:
  - [python2.7](https://packages.debian.org/TODO/python2.7);
  - [python3.5](https://packages.debian.org/TODO/python3.5);
  - [python3.7](https://packages.debian.org/bullseye/python3.7);
  - [python3.8](https://packages.debian.org/TODO/python3.8);
  - [jython](https://packages.debian.org/TODO/jython);
  - [pypy](https://packages.debian.org/TODO/pypy).
  - [pypy3](https://packages.debian.org/TODO/pypy3).

## Usage

    sudo docker pull paternal/pythons
    sudo docker run -i -t paternal/pythons /bin/bash

