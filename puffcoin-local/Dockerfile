FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    libboost-all-dev \
    libcurl4-openssl-dev \
    libdb5.3-dev \
    libdb5.3++-dev \
    git \
    libminiupnpc-dev \
    zlib1g-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/puffcoin/puffcoin.git /puffcoin

WORKDIR /puffcoin/src
RUN make -f makefile.unix USE_UPNP=-

EXPOSE 8333 8332

CMD ["./puffcoind"]
