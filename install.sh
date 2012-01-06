#!/bin/sh

set -e

if [ -z "${PREFIX}" ]; then
  PREFIX="/usr/local"
fi

BIN_PATH="${PREFIX}/bin"
SHARE_PATH="${PREFIX}/share/R-build"

mkdir -p "${BIN_PATH}"
mkdir -p "${SHARE_PATH}"

for file in bin/*; do
  cp "${file}" "${BIN_PATH}"
done

for file in share/R-build/*; do
  cp "${file}" "${SHARE_PATH}"
done

echo "Installed R-build at ${PREFIX}"
