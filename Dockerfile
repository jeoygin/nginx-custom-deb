FROM ubuntu:14.04

MAINTAINER Nginx Custom Debian Package Docker Maintainers "jeoygin@gmail.com"

RUN mkdir /root/nginx
ADD nginx_signing.key /root/nginx/

WORKDIR /root/nginx

ADD nginx.list /etc/apt/sources.list.d/
RUN apt-key add nginx_signing.key

ENV NGINX_VERSION 1.6.2-1

RUN apt-get update && apt-get build-dep -y nginx=${NGINX_VERSION} && apt-get source -y nginx=${NGINX_VERSION} 
ADD rules nginx-1.6.2/debian/

WORKDIR nginx-1.6.2

RUN dpkg-buildpackage -uc -b -j2

WORKDIR /root
