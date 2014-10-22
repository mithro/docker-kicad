
FROM ubuntu:14.10
MAINTAINER mithro@mithis.com

# Update the Ubuntu image to prevent it occuring below
#RUN \
#  apt-get update && \
#  apt-get upgrade

# Add the kicad PPA, update packages, install dependencies, then kicad
RUN \
  echo 'APT::Get::Assume-Yes "true";' > /etc/apt/apt.conf.d/yes && \
  apt-get update && \
  export DKICAD_INSTALL=/tmp/kicad-install.sh && \
  python3 -c "import sys as s; from urllib.request import urlopen as o; s.stdout.detach().write(o(s.argv[1]).read())" \
    "http://bazaar.launchpad.net/~kicad-product-committers/kicad/product/download/head:/kicadinstall.sh-20131017152909-uyumxtw74s418lqr-1/kicad-install.sh" > $DKICAD_INSTALL && \
  md5sum $DKICAD_INSTALL && \
  chmod a+rx $DKICAD_INSTALL && \
  $DKICAD_INSTALL --install-or-update && \
  $DKICAD_INSTALL --remove-sources && \
  apt-get remove \
    bzr bzrtools build-essential cmake cmake-curses-gui debhelper doxygen \
    libbz2-dev libcairo2-dev libglew-dev libssl-dev libwxgtk3.0-dev && \
  apt-get autoremove && \
  rm $DKICAD_INSTALL && \
  rm /etc/apt/apt.conf.d/yes

# Add the kicad user
#RUN adduser --disabled-password --gecos "" kicad
#USER kicad
# Download the .pretty component libraries
#ENV DKICAD_FPTABLE /home/kicad/.config/kicad/fp-lib-table
#ENV DKICAD_LIBINSTALL /home/kicad/.config/kicad/library-repos-install.sh
#ENV DKICAD_PRETTY /home/kicad/kicad_sources/library-repos
#RUN \
#  mkdir -p ~/.config/kicad/ && \
#  curl "https://raw.githubusercontent.com/KiCad/kicad-library/master/template/fp-lib-table.for-pretty" > $DKICAD_FPTABLE && md5sum $DKICAD_FPTABLE && \
#  curl "http://bazaar.launchpad.net/~kicad-product-committers/kicad/product/download/head:/libraryreposinstall.-20131202165949-wv7mnbj220s2m4cy-1/library-repos-install.sh" > $DKICAD_LIBINSTALL && chmod a+rx $DKICAD_LIBINSTALL && md5sum $DKICAD_LIBINSTALL && \
#  mkdir -p $DKICAD_PRETTY && $DKICAD_LIBINSTALL --install-or-update && \
#  ls -l $DKICAD_PRETTY
#ENV KISYSMOD /home/kicad/kicad_sources/library-repos
#WORKDIR /home/kicad/
