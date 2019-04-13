FROM ubuntu:18.04
RUN apt update && apt upgrade -y && \
    apt install software-properties-common make git wget python2.7 \
                build-essential pkg-config libglib2.0-dev libpixman-1-dev -y

# Download ARM64 Ubuntu Image
RUN wget --quiet http://cdimage.ubuntu.com/releases/18.04/release/ubuntu-18.04.2-server-arm64.iso

# Install QEMU 3
RUN wget --quiet https://download.qemu.org/qemu-3.1.0.tar.xz && \
    tar xf qemu-3.1.0.tar.xz && \
    rm qemu-3.1.0.tar.xz
WORKDIR qemu-3.1.0
RUN ./configure --enable-modules --enable-tcg-interpreter --enable-debug-tcg
    --target-list=arm-softmmu,aarch64-softmmu --python=/usr/bin/python2.7 && \
    make && make install
WORKDIR /
RUN rm -rf qemu-3.1.0

# ...
