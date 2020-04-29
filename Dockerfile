FROM kong:2.0.4-alpine

COPY kong.conf /etc/kong/

USER root

COPY ./plugins/pepkong /custom-plugins/pepkong

WORKDIR /custom-plugins/pepkong

RUN luarocks make

USER kong
