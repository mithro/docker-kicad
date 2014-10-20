# docker-kicad

Latest KiCad installed inside a docker container from ppa:js-reynaud/ppa-kicad

# Launching GUI

Allow X connections from anywhere with `xhost +` on container.

Run docker container with the following extra arguments;
 * `-v /tmp/.X11-unix:/tmp/.X11-unix` - Maps the X11 sockets into the docker container. 
 * `-e DISPLAY=$DISPLAY` - Set up the $DISPLAY environment variable.

See http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/

