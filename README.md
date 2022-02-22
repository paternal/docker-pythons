paternal/pythons
================

![Docker Stars](https://badgen.net/docker/stars/paternal/pythons?icon=docker&label=stars)
![Docker Pulls](https://badgen.net/docker/pulls/paternal/pythons?icon=docker&label=pulls)

A docker image with several python versions, and associated python tools.

> ⚠ Warning: If you were using those images before february 2022, be aware that the way Python versions are installed are installed have changed.
>
> - Before: Python was installed using apt (which was a mess).
> - Now: Python is compiled from source.
>
> The result is that *more* Python versions are now installed.
>
> The old images are still available using the old tags (`stretch`, `buster`, `bullseye`, `bookworm`), but they will be removed some day without notice.

This image is Debian stable, with the following Python versions compiled from source:

- [Python](https://www.python.org/downloads/):
  2.7,
  3.6,
  3.7,
  3.8,
  3.9,
  3.10,
  3.11.
- [Pypy](https://www.pypy.org/download.html):
  2.7,
  3.7,
  3.8,
  3.9.
- [Jython](https://www.jython.org/download):
  2.7.
- Some python packages are installed using pip3:
  [black](https://pypi.python.org/pypi/black)
  [coverage](https://pypi.python.org/pypi/coverage)
  [pycodestyle](https://pypi.python.org/pypi/pycodestyle)
  [pylint](https://pypi.python.org/pypi/pylint)
  [tox](https://pypi.python.org/pypi/tox)

The accurate versions of each tools (excepted thoses installed using pip3) is available at the start of the [Dockerfile](https://framagit.org/spalax/docker-pythons/-/blob/main/Dockerfile).

I try to keep the tools here up-to-date. However, if a new version of whatever binary is installed here is available, and I did not update this Docker image, please contact me ([issue tracker](https://framagit.org/spalax/docker-pythons/-/issues) or mail at the beginning of the [Dockerfile](https://framagit.org/spalax/docker-pythons/-/blob/main/Dockerfile)).

## Usage

    sudo docker pull paternal/pythons
    sudo docker run -i -t paternal/pythons /bin/bash
