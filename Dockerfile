FROM ubuntu:22.04

ENV BUILDROOT_VERSION=2023.02.6

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    bc \
    binutils \
    bison \
    bzip2 \
    cpio \
    file \
    flex \
    g++ \
    gcc \
    git \
    graphviz \
    gzip \
    libfdt-dev \
    libncurses-dev \
    libssl-dev \
    locales \
    make \
    nano \
    patch \
    perl \
    python-is-python3 \
    python3 \
    python3-pip \
    rsync \
    sed \
    tar \
    unzip \
    wget \
 
RUN git clone git://git.buildroot.net/buildroot -c advice.detachedHead=false --depth=1 --branch=${BUILDROOT_VERSION} /root/buildroot

WORKDIR /root/buildroot
ENV O=/buildroot_output

RUN touch .config
RUN touch kernel.config
RUN locale-gen en_GB.utf8

VOLUME /root/buildroot/dl
VOLUME /buildroot_output

RUN ["/bin/bash"]
