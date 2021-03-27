FROM debian:{{ codename }}
LABEL maintainer "Louis Paternault <spalax@gresille.org>"

ARG DEBIAN_FRONTEND=noninteractive
RUN echo 'APT::Default-Release "{{ codename }}";' >  /etc/apt/apt.conf.d/99default-release
#RUN echo 'Acquire::http::proxy "http://192.168.0.34:3142";' > /etc/apt/apt.conf.d/02proxy # TODO Comment this line
{% for suite in suites -%}
{% if suite != codename -%}
RUN echo 'deb http://httpredir.debian.org/debian {{ suite }} main' > /etc/apt/sources.list.d/{{ suite }}.list
{% endif %}
{%- endfor %}

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
RUN python3 -m pip install \
  {{ pypi3|sort|join(" \\\n  ")}}

# Print versions
RUN for bin in {{ bin|sort|join(" ") }}; \
    do \
      echo "$bin $($bin --version 2>&1)"; \
    done

