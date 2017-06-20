paternal/pythons
================

A docker image with several python versions, and associated python tools.

## Tag `latest`: Available tools

This list describes the version available with the (default) `latest` tag (equivalent to `stretch`).

- It is based on a [debian stretch](https://www.debian.org/releases/stretch/) (the stable version), and is updated without notice when a new debian version is released.
- Most of the python versions packaged for debian are available, that is:
  - [python](https://packages.debian.org/stretch/python) (an alias to `python2.7` — see below);
  - [python2.7](https://packages.debian.org/stretch/python2.7);
  - [python3](https://packages.debian.org/stretch/python3) (an alias to `python3.5` — see below);
  - [python3.5](https://packages.debian.org/stretch/python3.5);
  - [python3.6](https://packages.debian.org/buster/python3.6);
  - [jython](https://packages.debian.org/stretch/jython);
  - [pypy](https://packages.debian.org/stretch/pypy);
  - [pip](https://pypi.python.org/pypi/pip) (both for [python2](https://packages.debian.org/stretch/python-pip) and [python3](https://packages.debian.org/stretch/python3-pip)).
- Some essential (to my taste) python packages are installed using pip:
  - [tox](https://pypi.python.org/pypi/tox).

If you *do* need `python3.4` as well, you can use tag `stretch34` (see below).

## Other tags

- `latest`: See above.
- `jessie`: A debian jessie with:
  - [python2.7](https://packages.debian.org/jessie/python2.7);
  - [python3.4](https://packages.debian.org/jessie/python3.4);
  - [python3.5](https://packages.debian.org/stretch/python3.5);
  - [python3.6](https://packages.debian.org/buster/python3.6);
  - [jython](https://packages.debian.org/jessie/jython);
  - [pypy](https://packages.debian.org/jessie/pypy).
- `stretch` (equivalent to `latest`): A debian stretch with:
  - [python2.7](https://packages.debian.org/stretch/python2.7);
  - [python3.5](https://packages.debian.org/stretch/python3.5);
  - [python3.6](https://packages.debian.org/buster/python3.6);
  - [jython](https://packages.debian.org/stretch/jython);
  - [pypy](https://packages.debian.org/stretch/pypy).
- `stretch34`: Same as `stretch`:
  - with [python3.4](https://packages.debian.org/jessie/python3.4);
  - without [findutils](https://packages.debian.org/stretch/findutils) (an [essential](https://www.debian.org/doc/debian-policy/ch-binary.html#s3.8) package that has to be removed to install python3.4).
- `buster`: A debian buster with:
  - [python2.7](https://packages.debian.org/buster/python2.7);
  - [python3.5](https://packages.debian.org/buster/python3.5);
  - [python3.6](https://packages.debian.org/buster/python3.6);
  - [jython](https://packages.debian.org/buster/jython);
  - [pypy](https://packages.debian.org/buster/pypy).


## Usage

    sudo docker pull paternal/pythons
    sudo docker run -i -t paternal/pythons /bin/bash

