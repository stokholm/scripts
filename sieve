#!/bin/bash
#
# sieve: Search for files by string(s) in name
#

if [[ ${#} -lt 2 ]]; then
  echo Usage: sieve PATH STRING... >&2
  exit 1
fi

find_args () {
  echo -n "-ipath \"*${2}*\""
  shift 2
  for ARG in ${@}; do
    echo -n " -and -ipath \"*${ARG}*\""
  done
}

eval exec find ${1} $(find_args ${@}) 2>/dev/null
