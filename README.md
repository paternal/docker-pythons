paternal/pythons
================

![Docker Stars](https://badgen.net/docker/stars/paternal/pythons?icon=docker&label=stars)
![Docker Pulls](https://badgen.net/docker/pulls/paternal/pythons?icon=docker&label=pulls)

A docker image with several python versions, and associated python tools.

> ⚠ Warning: If you were using those images before february 2022, be aware that the way Python versions are installed have changed.
>
> - Before: Python was installed using apt (which was a mess).
> - Now: Python is compiled from source.
>
> The result is that *more* Python versions are now installed.

This image is Debian stable, with the following Python versions compiled from source:

- [Python](https://www.python.org/downloads/):
  2.7,
  3.7,
  3.8,
  3.9,
  3.10,
  3.11,
  3.12,
  3.13,
  3.14.
- [Pypy](https://www.pypy.org/download.html):
  2.7,
  3.7,
  3.8,
  3.9,
  3.10,
  3.11.
- [Jython](https://www.jython.org/download):
  2.7.
- [MicroPython](https://micropython.org):
  1.26.
- Even more Python implementations, installed from [Pypi](https://pypi.org/project):
  - [Cython](https://cython.org)
  - [Numba](https://numba.pydata.org)
  - [Nuitka](https://nuitka.net)
- Some python packages are installed using pip3:
  [black](https://pypi.python.org/pypi/black)
  [build](https://pypi.python.org/pypi/build)
  [coverage](https://pypi.python.org/pypi/coverage)
  [pycodestyle](https://pypi.python.org/pypi/pycodestyle)
  [pylint](https://pypi.python.org/pypi/pylint)
  [tox](https://pypi.python.org/pypi/tox)

Missing a tool? Contact me to add any Python package from the [Python Packaging Authority](https://github.com/pypa/), the [Python Software Foundation](https://github.com/psf/), or [Python Code Quality Authority](https://github.com/PyCQA/).

The accurate versions of each tools (excepted thoses installed using pip3) is available at the start of the [Dockerfile](https://framagit.org/spalax/docker-pythons/-/blob/main/Dockerfile).

I try to keep the tools here up-to-date: when a new python or Debian version is available, this image is updated soon after, without notice.
However, if a new version of whatever binary is installed here is available, and I did not update this Docker image yet, please contact me ([issue tracker](https://framagit.org/spalax/docker-pythons/-/issues) or mail at the beginning of the [Dockerfile](https://framagit.org/spalax/docker-pythons/-/blob/main/Dockerfile)).

## Usage

    sudo docker pull paternal/pythons
    sudo docker run -i -t paternal/pythons /bin/bash
