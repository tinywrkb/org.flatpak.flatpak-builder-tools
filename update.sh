#!/bin/sh

_FPID=org.flatpak.flatpak-builder-tools

[ -f ${_FPID}.yaml ] || { echo "Can't find ${_FPID}.yaml"; exit 1; }

flatpak run --filesystem=$PWD org.flathub.flatpak-external-data-checker --edit-only ${_FPID}.yaml
./tools/pip-updater
./tools/cpan-updater
