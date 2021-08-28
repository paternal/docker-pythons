FROM debian:{{ codename }}
LABEL maintainer "Louis Paternault <spalax@gresille.org>"

ARG DEBIAN_FRONTEND=noninteractive

#COPY apt.conf.d/02proxy /etc/apt/apt.conf.d/02proxy
COPY apt.conf.d/99default-release /etc/apt/apt.conf.d/99default-release
COPY preferences /et/apt/preferences
COPY sources.list /etc/apt/sources.list.d/others.list

RUN \
  apt update --yes \
  && \
  {% for suite in suites -%}
  apt install --yes {% if suite != codename %}--target-release {{ suite }}{% endif %} \
      {%- for package in suites[suite]|sort %}
      {{ package }} \
      {%- endfor %}
      && \
  {% endfor -%}
  apt-get clean

RUN python3 -m pip install -U pip setuptools
RUN python3 -m pip install \
  {{ pypi3|sort|join(" \\\n  ")}}

# Print versions
RUN for bin in {{ bin|sort|join(" ") }}; \
    do \
      echo "$bin $($bin --version 2>&1)"; \
    done

