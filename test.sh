#!/usr/bin/env bash

echo "Testing default target"

shouldBe="Welcome to Alpine Linux 3.9"
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
is="$(DOCKERFILE=./dckr.Dockerfile.example TARGET=debian-next ./dckr shellcheck --version  2>/dev/null | grep version: | tr -s '\r' '\n')"
if [ "$is" != "$shouldBe" ]; then
  echo "Should have been: $shouldBe"
  echo "Was: $is"
  exit 1
fi

echo "Linting"

shellcheck -a -x "./test.sh"
shellcheck -a -x "./dckr"
