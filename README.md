paternal/pythons
================

A docker image with several python versions, and associated python tools.

## Tags

- `latest` uses the stable debian version. It is updated without notice when a new debian version is released.
- `jessie` uses debian jessie.

## Available tools

- It is based on a [debian jessie](https://www.debian.org/releases/jessie/) (the stable version).
- Most of the python versions packaged for debian are available, that is:
  - [python](https://packages.debian.org/jessie/python) (an alias to `python2.7` — see below);
  - [python2.7](https://packages.debian.org/jessie/python2.7);
  - [python3](https://packages.debian.org/jessie/python3) (an alias to `python3.4` — see below);
  - [python3.4](https://packages.debian.org/jessie/python3.4);
  - [python3.5](https://packages.debian.org/stretch/python3.5);
  - [python3.6](https://packages.debian.org/experimental/python3.6);
  - [jython](https://packages.debian.org/jessie/jython);
  - [pypy](https://packages.debian.org/jessie/pypy).
- Some essential (to my taste) python packages are installed using pip:
  - [tox](https://pypi.python.org/pypi/tox).

## Usage

    sudo docker pull paternal/pythons
    sudo docker run -i -t paternal/pythons /bin/bash

