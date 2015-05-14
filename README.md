# PTL-lulzbot

This an automated build of custom cura version by Lulzbot to simplify Post Tenebras Lab 3d printer

https://www.lulzbot.com/cura/debian-installation

Just need to pull docker container and run it.

## Usage :

docker search PTL-lulzbot

docker pull "container you want"

docker run -v dir_with_stl_files:/home/ptl/ -v /dev/ttyACM0:/dev/ttyACM0 \
           ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix PTL-lulzbot


  select Lulzbot 4 

  and enjoy ;-)
