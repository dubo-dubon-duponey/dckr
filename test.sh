#!/usr/bin/env bash

echo "Linting"

if ! shellcheck -a -x "./test.sh"; then
  echo "Failed linting test.sh"
  exit 1
fi

if ! shellcheck -a -x "./dckr"; then
  echo "Failed linting dckr"
  exit 1
fi

if ! hadolint dckr.Dockerfile; then
  echo "Failed linting dckr.Dockerfile"
  exit 1
fi

if ! hadolint dckr.Dockerfile.example; then
  echo "Failed linting dckr.Dockerfile.example"
  exit 1
fi

echo "Testing default target"

shouldBe="Welcome to Alpine Linux 3.10"
is="$(./dckr cat /etc/issue 2>/dev/null | grep Alpine | tr -s '\r' '\n')"
if [ "$is" != "$shouldBe" ]; then
  echo "Should have been: $shouldBe"
  echo "Was: $is"
  exit 1
fi

echo "Testing custom target"

shouldBe="Ubuntu 18.04.2 LTS \n \l"
is="$(TARGET=ubuntu-lts-current ./dckr cat /etc/issue 2>/dev/null | grep Ubuntu | tr -s '\r' '\n')"
if [ "$is" != "$shouldBe" ]; then
  echo "Should have been: $shouldBe"
  echo "Was: $is"
  exit 1
fi

echo "Testing custom dockerfile with debian target"

shouldBe="version: 0.5.0"
is="$(DOCKERFILE=./dckr.Dockerfile.example TARGET=debian-current ./dckr shellcheck --version  2>/dev/null | grep version: | tr -s '\r' '\n')"
if [ "$is" != "$shouldBe" ]; then
  echo "Should have been: $shouldBe"
  echo "Was: $is"
  exit 1
fi
