FROM ubuntu:14.04

RUN apt-get update && apt-get install wget --assume-yes

RUN wget -qO - http://download.alephobjects.com/ao/aodeb/aokey.pub | sudo apt-key add - 
RUN sed -i '$a deb http://download.alephobjects.com/ao/aodeb jessie main' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install cura --assume-yes

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/ptl && \
    echo "ptl:x:${uid}:${gid}:Post Tenebras Lab,,,:/home/ptl:/bin/bash" >> /etc/passwd && \
    echo "ptl:x:${uid}:" >> /etc/group && \
    echo "ptl ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ptl && \
    chmod 0440 /etc/sudoers.d/ptl && \
    chown ${uid}:${gid} -R /home/ptl

RUN usermod -a -G tty ptl && \
    usermod -a -G dialout ptl

    USER ptl
    ENV HOME /home/ptl
    CMD /usr/bin/cura
