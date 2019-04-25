##################################################################
### Base images
##################################################################
FROM alpine:3.9 as alpine-current
RUN apk update && apk upgrade
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD /bin/sh

FROM debian:stretch as debian-current
RUN apt-get update && apt-get -y upgrade
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD /bin/sh

FROM debian:buster as debian-next
RUN apt-get update && apt-get -y upgrade
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD /bin/sh

# trusty / 14.04: EOL 25 April 2019
FROM ubuntu:trusty as ubuntu-lts-old
RUN apt-get update && apt-get -y upgrade
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD /bin/sh

# 16.04
FROM ubuntu:xenial as ubuntu-lts-previous
RUN apt-get update && apt-get -y upgrade
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD /bin/sh

# 18.04
FROM ubuntu:bionic as ubuntu-lts-current
RUN apt-get update && apt-get -y upgrade
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD /bin/sh

# 19.04
#FROM ubuntu:19.04 as ubuntu-next
#RUN apt-get update && apt-get -y upgrade
#WORKDIR /dckr-project-mount
#VOLUME /dckr-project-mount
#CMD /bin/sh
