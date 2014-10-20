
FROM ubuntu:14.04

MAINTAINER mithro@mithis.com

# Update the Ubuntu image to prevent it occuring below
#RUN \
#  apt-get update && \
#  apt-get upgrade

# Add the kicad PPA, update packages, install dependencies, then kicad
COPY simple-add-ppa.sh /usr/local/bin/
RUN \
  chmod a+x /usr/local/bin/simple-add-ppa.sh && \
  simple-add-ppa.sh ppa:js-reynaud/ppa-kicad 910F124E trusty && \
  apt-get update && \
  apt-get install -y curl git sed && \
  apt-get install -y kicad.*

RUN apt-get install xeyes

# Add the Xilinx user
RUN adduser --disabled-password --gecos "" kicad
USER kicad
# Download the .pretty component libraries
ENV DKICAD_FPTABLE /home/kicad/.config/kicad/fp-lib-table
ENV DKICAD_LIBINSTALL /home/kicad/.config/kicad/library-repos-install.sh
ENV DKICAD_PRETTY /home/kicad/kicad_sources/library-repos
RUN \
  mkdir -p ~/.config/kicad/ && \
  curl "https://raw.githubusercontent.com/KiCad/kicad-library/master/template/fp-lib-table.for-pretty" > $DKICAD_FPTABLE && md5sum $DKICAD_FPTABLE && \
  curl "http://bazaar.launchpad.net/~kicad-product-committers/kicad/product/download/head:/libraryreposinstall.-20131202165949-wv7mnbj220s2m4cy-1/library-repos-install.sh" > $DKICAD_LIBINSTALL && chmod a+rx $DKICAD_LIBINSTALL && md5sum $DKICAD_LIBINSTALL && \
  mkdir -p $DKICAD_PRETTY && $DKICAD_LIBINSTALL --install-or-update && \
  ls -l $DKICAD_PRETTY
ENV KISYSMOD /home/kicad/kicad_sources/library-repos
WORKDIR /home/kicad/
