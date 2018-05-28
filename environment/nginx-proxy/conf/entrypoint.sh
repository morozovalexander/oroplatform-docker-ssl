#!/usr/bin/env sh

[ ! -z "${DEBUG}" ] && set -x

export SYMFONY_ENV=${SYMFONY_ENV-prod}

info () {
  [ ! -z "${ORO_VERBOSE}" ] && printf "\033[0;36m===> \033[0;33m%s\033[0m\n" "$1" 1>&2
}

error () {
  printf "\033[0;36m===> \033[49;31m%s\033[0m\n" "$1" 1>&2
}

exec "$@"
