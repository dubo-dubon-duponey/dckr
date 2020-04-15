#!/usr/bin/env bash
set -o errexit -o errtrace -o functrace -o nounset -o pipefail

COLOR_RED=1
COLOR_GREEN=2
COLOR_YELLOW=3

# Prefix a date to a log line and output to stderr
logger::stamp(){
  local color="$1"
  local level="$2"
  local i
  shift
  shift
  [ "$TERM" ] && [ -t 2 ] && >&2 tput setaf "$color"
  for i in "$@"; do
    >&2 printf "[%s] [%s] %s\\n" "$(date)" "$level" "$i"
  done
  [ "$TERM" ] && [ -t 2 ] && >&2 tput op
}

logger::info(){
  logger::stamp "$COLOR_GREEN" "INFO" "$@"
}

logger::warning(){
  logger::stamp "$COLOR_YELLOW" "WARNING" "$@"
}

logger::error(){
  logger::stamp "$COLOR_RED" "ERROR" "$@"
}

lint::dockerfile(){
  logger::info "Linting dockerfile:\n"
  >&2 printf " > %s\n" "$@"
  if ! hadolint "$@"; then
    logger::error "Failed linting Dockerfile\n"
    exit 1
  fi
}

lint::shell(){
  logger::info "Linting shellscript:\n"
  >&2 printf " > %s\n" "$@"
  if ! shellcheck -a -x "$@"; then
    logger::error "Failed shellchecking shell script\n"
    exit 1
  fi
}
