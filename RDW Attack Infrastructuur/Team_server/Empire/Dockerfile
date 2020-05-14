# image base
FROM ubuntu:20.04

# set the def shell for ENV
SHELL ["/bin/bash", "-c"]

# install basic build items
RUN apt-get update && apt-get install -qy \
    wget \
    curl \
    git \
    sudo \
    apt-utils \
    lsb-core \
    python2.7

# cleanup image
RUN apt-get -qy clean \
    autoremove

# build empire from source
# TODO: Find a solution for permission issues when merging into /opt
RUN git clone -b master https://github.com/BC-SECURITY/Empire.git /home/test/Desktop/Empire && \
    cd /opt/Empire/setup/ && \
    ./install.sh && \
    rm -rf /opt/Empire/data/empire*

WORKDIR "/opt/Empire"
ENTRYPOINT ["./empire"]