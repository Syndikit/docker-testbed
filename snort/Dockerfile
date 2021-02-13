FROM debian:latest
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
RUN apt update -y && apt upgrade -y \
    && apt-get install sudo build-essential \
    software-properties-common wget curl git \
    gcc libpcre3-dev zlib1g-dev libluajit-5.1-dev libpcap-dev openssl libssl-dev libnghttp2-dev libdumbnet-dev bison flex libdnet autoconf libtool -y
ADD ./install.sh ./install.sh
RUN chmod +x install.sh
ADD ./daq-2.0.7.tar.gz ./daq-2.0.7.tar.gz
ADD snort-2.9.17.tar.gz snort-2.9.17.tar.gz
RUN ./install.sh
EXPOSE 80
ENTRYPOINT [ "tail","-f","/dev/null" ] 