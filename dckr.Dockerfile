##################################################################
### Base images
##################################################################
FROM alpine:3.8 as alpine-current
RUN apk update && apk upgrade
WORKDIR /project
VOLUME /project
CMD /bin/sh

FROM debian:stretch as debian-current
RUN apt-get update && apt-get -y upgrade
WORKDIR /project
VOLUME /project
CMD /bin/sh

FROM debian:buster as debian-next
RUN apt-get update && apt-get -y upgrade
WORKDIR /project
VOLUME /project
CMD /bin/sh

FROM ubuntu:trusty as ubuntu-lts-old
RUN apt-get update && apt-get -y upgrade
WORKDIR /project
VOLUME /project
CMD /bin/sh

FROM ubuntu:xenial as ubuntu-lts-previous
RUN apt-get update && apt-get -y upgrade
WORKDIR /project
VOLUME /project
CMD /bin/sh

FROM ubuntu:bionic as ubuntu-lts-current
RUN apt-get update && apt-get -y upgrade
WORKDIR /project
VOLUME /project
CMD /bin/sh
