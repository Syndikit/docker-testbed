FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
RUN apt update -y && apt upgrade -y
RUN apt-get install git nmap curl \
    software-properties-common build-essential -y 
RUN apt-get update -y
RUN apt-get install nmap inetutils-traceroute -y 
EXPOSE 80 443
ENTRYPOINT [ "tail","-f","/dev/null" ] 