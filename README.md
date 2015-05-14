# PTL-lulzbot

This an automated build of custom cura version by Lulzbot to simplify Post Tenebras Lab 3d printer

https://www.lulzbot.com/cura/debian-installation

Just need to pull docker container and run it.

## Usage :

    docker search PTL-lulzbot
    
    docker pull posttenebraslab/ptl-lulzbot
    
    docker run -v local_dir:/home/ptl/ -v /dev/ttyACM0:/dev/ttyACM0 \
            --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
            posttenebraslab/ptl-lulzbot/ 


           
select Lulzbot TAZ 4  and enjoy ;-)
