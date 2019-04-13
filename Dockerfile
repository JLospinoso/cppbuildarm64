FROM ubuntu:18.04
RUN apt update && apt upgrade -y && \
    apt install software-properties-common make git -y && \
    add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    apt update && apt upgrade -y && \
    apt install wget qemu-system-arm -y

# Download ARM64 Ubuntu Image
RUN wget http://cdimage.ubuntu.com/releases/18.04/release/ubuntu-18.04.2-server-arm64.iso

# Launch QEMU
