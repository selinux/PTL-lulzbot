FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
        wget \
#        apt-transport-https \
#       ca-certificates \
        sudo

RUN sed -i '$a deb http://download.alephobjects.com/ao/aodeb jessie main' /etc/apt/sources.list && \
        wget -qO - http://download.alephobjects.com/ao/aodeb/aokey.pub | apt-key add - 

RUN apt-get update && apt-get install -y \
        cura && \
        rm -rf /var/lib/apt/lists/*

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/ptl && \
    echo "ptl:x:${uid}:${gid}:Post Tenebras Lab,,,:/home/ptl:/bin/bash" >> /etc/passwd && \
    echo "ptl:x:${uid}:" >> /etc/group && \
    echo "ptl ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ptl && \
    chmod 0440 /etc/sudoers.d/ptl && \
    mkdir /home/ptl/Documents && \
    mkdir /home/ptl/.cura && \
    mkdir /home/ptl/.local && \
    chown ${uid}:${gid} -R /home/ptl &&\
    usermod -a -G tty ptl && \
    usermod -a -G dialout ptl

USER ptl
ENV HOME /home/ptl
CMD /usr/bin/cura /home/ptl/Documents
