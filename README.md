# docker-kicad

Latest KiCad installed inside a docker container from ppa:js-reynaud/ppa-kicad

# Launching GUI

Allow X connections from anywhere with `xhost +` on container.

Run docker container with the following extra arguments;
 * `-v /tmp/.X11-unix:/tmp/.X11-unix` - Maps the X11 sockets into the docker container. 
 * `-e DISPLAY=$DISPLAY` - Set up the $DISPLAY environment variable.

See http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/



<br><br><br><br><br><br>

# KiCad EDA Software Suite

[KiCad][1] is an EDA software suite for the creation of professional schematics and printed circuit boards up to 32 copper layers. KiCad runs on Windows, Linux and Apple OS X and is released under the open-source GNU GPL v2 free of charge.

![KiCad Pcbnew, printed circuit board editor.][2]

With [KiCad][3] you can create schematic diagrams and printed circuit board up to 32 copper layers. [KiCad][4] comes with a rich set of libraries with 3D models as well.

[KiCad][5] includes a project manager and four main independent software tools:

 - **Eeschema**, schematic editor.
 - **Pcbnew**, printed circuit board editor.
 - **Gerbview**, GERBER file viewer.
 - **Cvpcb**, footprint selector for components association.

![KiCad Project][6]
![KiCad 3d Viewer][7]
![KiCad PCBnew][8]
![KiCad EESchema][9]
![KiCad CVPCB][10]

  [1]: http://www.kicad-pcb.org/
  [2]: http://www.kicad-pcb.org/download/attachments/589828/kicad_pcbnew.png
  [3]: http://www.kicad-pcb.org/
  [4]: http://www.kicad-pcb.org/
  [5]: http://www.kicad-pcb.org/
  [6]: http://www.kicad-pcb.org/download/thumbnails/589828/kicad.png
  [7]: http://www.kicad-pcb.org/download/thumbnails/589828/kicad_3dviewer.png
  [8]: http://www.kicad-pcb.org/download/thumbnails/589828/kicad_pcbnew.png
  [9]: http://www.kicad-pcb.org/download/thumbnails/589828/kicad_eeschema.png
  [10]: http://www.kicad-pcb.org/download/thumbnails/589828/kicad_cvpcb.png

