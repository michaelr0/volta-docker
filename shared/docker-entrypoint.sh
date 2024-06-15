#!/bin/sh

# docker-entrypoint.sh file based on https://github.com/composer/docker

isCommand() {
  # Retain backwards compatibility with common CI providers,
  # see: https://github.com/composer/docker/issues/107
  if [ "$1" = "sh" ]; then
    return 1
  fi

  volta help "$1" > /dev/null 2>&1
}

# check if the first argument passed in looks like a flag
if [ "${1#-}" != "$1" ]; then
  set -- volta "$@"
# check if the first argument passed in is volta
elif [ "$1" = 'volta' ]; then
  set -- "$@"
# check if the first argument passed in matches a known command
elif isCommand "$1"; then
  set -- volta "$@"
fi

exec "$@"
