#!/bin/sh

set -x
set -e

REPO="$(echo $1 | sed -e's/ppa://')"
FILE="$(echo $1 | sed -e's/[^A-Za-z-]/-/g').list"
KEY=$2

DISTRIB_CODENAME="$(lsb_release -c -s || echo $3)"
if [ -z $DISTRIB_CODENAME ]; then
  echo "Can't find DISTRIB_CODENAME via lsb_release, give it as third argument."
  exit 1
fi

cat > /etc/apt/sources.list.d/$FILE <<EOF
deb http://ppa.launchpad.net/$REPO/ubuntu $DISTRIB_CODENAME main
deb-src http://ppa.launchpad.net/$REPO/ubuntu $DISTRIB_CODENAME main 
EOF

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys $KEY
