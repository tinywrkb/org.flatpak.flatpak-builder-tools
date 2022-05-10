#!/bin/sh

_FPID=org.flatpak.flatpak-builder-tools

[ -f ${_FPID}.yaml ] || { echo "Can't find ${_FPID}.yaml"; exit 1; }

_TOOLSDIR=$PWD/tools

flatpak-external-data-checker --edit-only ${_FPID}.yaml

# python modules with multiple dependencies and have a requirements.txt file
for _mod in python-aiohttp; do
  (
    cd $_mod
    ${_TOOLSDIR}/pip-updater $(basename $_mod)
  )
done

${_TOOLSDIR}/cpan-updater
