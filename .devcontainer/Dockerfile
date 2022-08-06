ARG image_tag=bullseye
ARG uid=1000
ARG gid=1000

FROM debian:${image_tag}

#
# * vim git : Utilities.
# * build-essential gdb clang-format: C/C++ debugger and formatter.
# * ruby : Generate Makefile.
#
RUN apt update && \
    apt install -y \
        vim git \
        build-essential gdb clang-format \
        ruby \
        && \
    apt clean && rm -rf /var/lib/apt/lists/*

ARG gid
ARG uid

RUN groupadd -g ${gid} cppuser && \
    useradd -u ${uid} -g ${gid} -s /bin/bash -m cppuser

USER cppuser
