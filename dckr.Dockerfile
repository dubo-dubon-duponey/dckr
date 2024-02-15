# hadolint global ignore=DL3059,DL3008,DL3009
##################################################################
### Base images
##################################################################
FROM alpine:3.4 as alpine-34
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.5 as alpine-35
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.6 as alpine-36
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.7 as alpine-37
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

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

FROM alpine:3.12 as alpine-312
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.13 as alpine-313
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.14 as alpine-314
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.15 as alpine-315
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.16 as alpine-316
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.17 as alpine-317
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.18 as alpine-318
RUN apk update
RUN adduser -D -g dckr dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM alpine:3.19 as alpine-319
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

FROM debian:bullseye-slim as debian-11
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM debian:bookworm-slim as debian-12
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM debian:testing-slim as debian-current
RUN apt-get update
RUN apt-get install -qq --no-install-recommends adduser
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM debian:unstable-slim as debian-next
RUN apt-get update
RUN apt-get install -qq --no-install-recommends adduser
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

FROM ubuntu:focal as ubuntu-2004
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM ubuntu:jammy as ubuntu-2204
RUN apt-get update
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM ubuntu:rolling as ubuntu-current
RUN apt-get update
RUN apt-get install -qq --no-install-recommends adduser
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]

FROM ubuntu:devel as ubuntu-next
RUN apt-get update
RUN apt-get install -qq --no-install-recommends adduser
RUN addgroup dckr && useradd -d /home/dckr -g dckr -m -s /bin/bash dckr
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
CMD ["/bin/sh"]
