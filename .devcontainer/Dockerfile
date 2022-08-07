ARG image_tag=bullseye
ARG uid=1000
ARG gid=1000

FROM debian:${image_tag}

#
# * vim git : Utilities.
# * build-essential cmake gdb clang-format: C/C++ test, debugger and formatter.
# * ruby : Generate Makefile.
#
RUN apt update && \
    apt install -y \
        vim git \
        build-essential cmake gdb clang-format \
        ruby \
        && \
    apt clean && rm -rf /var/lib/apt/lists/*

ARG gid
ARG uid

RUN groupadd -g ${gid} cppuser && \
    useradd -u ${uid} -g ${gid} -s /bin/bash -m cppuser

#
# GoogleTest (C++ testing library).
#
# refs: https://github.com/google/googletest/blob/main/googletest/README.md
#
RUN cd /usr/local/src && \
    git clone --depth 1 https://github.com/google/googletest.git && \
    cd googletest && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

USER cppuser
