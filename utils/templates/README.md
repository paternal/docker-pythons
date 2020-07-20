paternal/pythons
================

![Docker Stars](https://badgen.net/docker/stars/paternal/pythons?icon=docker&label=stars)
![Docker Pulls](https://badgen.net/docker/pulls/paternal/pythons?icon=docker&label=pulls)

A docker image with several python versions, and associated python tools.

Note than when installing recent python versions on old debian versions, other packages are also pulled from this newer debian version. So, althought the system you get is based on a given debian version, it can contain packages (including *core* packages like binutils or libc6) from several debian versions.

## Tag `latest`

The default `latest` tag is equivalent to the `stable` debian version (that is, `{{ stable }}`).

{% for codename in suites %}
## Tag `{{ codename }}`

Based on a [debian {{ codename }}](https://www.debian.org/releases/{{ codename }}/).

- Most of the python versions packaged for debian are available, that is:

    {%- for package in suites[codename]|sort %}
    - [{{ package }}](https://packages.debian.org/{{ suites[codename][package] }}/{{ package }})

    {%- endfor %}

- Some essential (to my taste) python packages are installed using pip:

    {%- for package in pypi3 %}
    - [{{ package }}](https://pypi.python.org/pypi/{{ package }})

    {%- endfor %}

{% endfor %}

## Usage

    sudo docker pull paternal/pythons
    sudo docker run -i -t paternal/pythons /bin/bash

