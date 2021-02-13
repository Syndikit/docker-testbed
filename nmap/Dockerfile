FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
RUN apt update -y && apt upgrade -y
RUN apt-get install git nginx curl \
    software-properties-common build-essential -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf
RUN apt-get update -y
RUN apt-get install nmap inetutils-traceroute -y 
EXPOSE 80 443
CMD ["nginx"]