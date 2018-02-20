FROM alpine

######################################################
# Packages
######################################################
RUN apk update && \
    apk add --no-cache \
    git \
    build-base \
    ctags \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    make \
    ncurses-dev \
    python \
    python-dev \
    bash

######################################################
# VIM
######################################################
RUN git clone https://github.com/vim/vim \
 && cd vim \
 && ./configure \
    --disable-gui \
    --disable-netbeans \
    --enable-multibyte \
    --enable-pythoninterp \
    --with-features=big \
    --with-python-config-dir=/usr/lib/python2.7/config \
 && make install
COPY config/vim /root/.vim
COPY config/vimrc /root/.vimrc

######################################################
# Bash
######################################################
COPY config/bashrc /root/.bashrc
COPY lib/ /soyouz
