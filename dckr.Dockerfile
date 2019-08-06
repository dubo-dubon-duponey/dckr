##################################################################
### Base images
##################################################################
FROM alpine:3.10 as alpine-current
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

FROM debian:stretch-slim as debian-old
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM debian:buster-slim as debian-current
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM debian:testing-slim as debian-next
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

# 16.04
FROM ubuntu:xenial as ubuntu-lts-old
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

# 18.04
FROM ubuntu:bionic as ubuntu-lts-current
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

# 19.04 - disco
FROM ubuntu:rolling as ubuntu-current
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

# 19.10 - eoan
FROM ubuntu:devel as ubuntu-next
# hadolint ignore=DL3009
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]
