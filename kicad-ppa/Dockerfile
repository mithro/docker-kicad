
FROM ubuntu:14.04

MAINTAINER mithro@mithis.com

# Update the Ubuntu image to prevent it occuring below
#RUN \
#  apt-get update && \
#  apt-get upgrade

COPY simple-add-ppa.sh /usr/local/bin/
COPY download-kicad-library.sh /usr/local/bin/

# Add the kicad PPA, update packages, install dependencies, then kicad
RUN \
  ls -l /usr/local/bin && \
  simple-add-ppa.sh ppa:js-reynaud/ppa-kicad 910F124E trusty && \
  apt-get update && \
  apt-get install -y curl git sed && \
  apt-get install -y kicad.*

# Add the kicad user
RUN adduser --disabled-password --gecos "" kicad
USER kicad
# Download the .pretty component libraries
RUN download-kicad-library.sh
ENV KISYSMOD /home/kicad/kicad_sources/library-repos

# Configuration and start up
VOLUME ["/home/kicad/projects", "/home/kicad/.kicad"]
WORKDIR /home/kicad/
ENTRYPOINT ["kicad"]
