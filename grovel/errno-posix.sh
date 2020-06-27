#!/bin/bash
set -eu -o pipefail
cd "$(dirname "$0")"
curl --fail --silent --show-error \
    https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/errno.h.html |
    grep -E '<dt>\[E[A-Z0-9]+\]</dt>' |
    grep -oE 'E[A-Z0-9]+' >errno-posix.text
