##################################################################
### Base images
##################################################################
FROM alpine:3.8 as alpine-38
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.9 as alpine-39
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.10 as alpine-310
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.11 as alpine-311
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:edge as alpine-next
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM debian:jessie-slim as debian-8
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM debian:stretch-slim as debian-9
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM debian:buster-slim as debian-10
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM debian:testing-slim as debian-current
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM debian:unstable-slim as debian-next
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM ubuntu:trusty as ubuntu-1404
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM ubuntu:xenial as ubuntu-1604
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

# 18.04
FROM ubuntu:bionic as ubuntu-1804
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM ubuntu:rolling as ubuntu-current
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM ubuntu:devel as ubuntu-next
# hadolint ignore=DL3009
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]
