FROM ubuntu:latest AS builder

RUN apt update &&  \ 
    apt install -y git build-essential autoconf libtool libpsl-dev 

RUN cd $HOME && \
    mkdir -p $HOME/code && \
    cd $HOME/code && \
    git clone https://github.com/defo-project/openssl && \
    cd openssl && \
    ./config --libdir=lib --prefix=$HOME/code/openssl-local-inst && \
    make -j8 && \
    make install_sw

RUN cd $HOME/code && \
    git clone https://github.com/curl/curl && \
    cd curl && \
    autoreconf -fi && \
    LDFLAGS="-Wl,-rpath,$HOME/code/openssl-local-inst/lib/" ./configure --with-ssl=$HOME/code/openssl-local-inst --enable-ech && \
    make && \
    make install && \
    ldconfig 

FROM builder

COPY --from=builder /usr/local/bin /usr/local/bin
ENTRYPOINT ["/usr/local/bin/curl"] 
