FROM ubuntu:18.04
RUN apt update && apt upgrade -y && \
    apt install software-properties-common make git -y && \
    add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    apt update && apt upgrade -y && \
    apt install qemu-system-arm -y

# Launch QEMU
