#!/usr/bin/env bash
set -o errexit -o errtrace -o functrace -o nounset -o pipefail

# Linting
. tooling/helpers.sh
lint::shell dckr ./*.sh ./*/*.sh
lint::dockerfile ./*Dockerfile*
logger::info "Linting successful\n"

logger::info "Testing default target"

export CACHE_DIR=cache

shouldBe="Debian GNU/Linux bullseye/sid \n \l"
is="$(./dckr cat /etc/issue 2>/dev/null | grep Debian | tr -s '\r' '\n')" || true
if [ "$is" != "$shouldBe" ]; then
  logger::error "Should have been: $shouldBe"
  logger::error "Was: $is"
  exit 1
fi

logger::info "Testing custom target"

shouldBe="Ubuntu 14.04.6 LTS \n \l"
is="$(TARGET=ubuntu-1404 ./dckr cat /etc/issue 2>/dev/null | grep Ubuntu | tr -s '\r' '\n')" || true
if [ "$is" != "$shouldBe" ]; then
  logger::error "Should have been: $shouldBe"
  logger::error "Was: $is"
  exit 1
fi

logger::info "Testing custom dockerfile with debian target"

shouldBe="version: 0.5.0"
is="$(DOCKERFILE=./dckr.Dockerfile.example TARGET=debian-10 ./dckr shellcheck --version  2>/dev/null | grep version: | tr -s '\r' '\n')" || true
if [ "$is" != "$shouldBe" ]; then
  logger::error "Should have been: $shouldBe"
  logger::error "Was: $is"
  exit 1
fi
