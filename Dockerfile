FROM kong:2.0.3

COPY kong.conf /etc/kong/

USER root

COPY ./plugins/pepkong /custom-plugins/pepkong
COPY ./plugins/wslifetime /custom-plugins/wslifetime

WORKDIR /custom-plugins/pepkong

RUN luarocks make

WORKDIR /custom-plugins/wslifetime

RUN luarocks make

USER kong