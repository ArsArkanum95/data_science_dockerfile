FROM ubuntu:bionic

RUN apt-get update && apt-get install -y gnupg
RUN echo 'deb http://downloads.skewed.de/apt/bionic bionic universe' >> /etc/apt/sources.list && \
    echo 'deb-src http://downloads.skewed.de/apt/bionic bionic universe' >> /etc/apt/sources.list

RUN apt-key adv --keyserver pgp.skewed.de --recv-key 612DEFB798507F25
ENV DEBIAN_FRONTEND=noninteractive

COPY apt_packages.txt packages.txt
RUN apt-get update && apt-get install -y python3 python3-setuptools python3-dev python3-pip && \
    xargs -a packages.txt apt-get install -y

COPY python_packages.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY setup.sh setup.sh
RUN ["bash", "setup.sh"]

WORKDIR /workdir

