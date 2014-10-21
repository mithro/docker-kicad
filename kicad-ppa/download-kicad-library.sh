#!/bin/sh

set -x
set -e

DKICAD_FPTABLE=/home/kicad/.config/kicad/fp-lib-table
DKICAD_LIBINSTALL=/tmp/library-repos-install.sh
DKICAD_PRETTY=/home/kicad/kicad_sources/library-repos

mkdir -p ~/.config/kicad/
curl "https://raw.githubusercontent.com/KiCad/kicad-library/master/template/fp-lib-table.for-pretty" > $DKICAD_FPTABLE
md5sum $DKICAD_FPTABLE

curl "http://bazaar.launchpad.net/~kicad-product-committers/kicad/product/download/head:/libraryreposinstall.-20131202165949-wv7mnbj220s2m4cy-1/library-repos-install.sh" > $DKICAD_LIBINSTALL
chmod a+rx $DKICAD_LIBINSTALL
md5sum $DKICAD_LIBINSTALL
mkdir -p $DKICAD_PRETTY
$DKICAD_LIBINSTALL --install-or-update
ls -l $DKICAD_PRETTY
