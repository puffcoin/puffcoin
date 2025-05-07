FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Установка зависимостей
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

# Клонируем репозиторий
RUN git clone https://github.com/puffcoin/puffcoin.git /puffcoin

# Сборка
WORKDIR /puffcoin/src
RUN make -f makefile.unix USE_UPNP=-

# Создаём директорию для данных
RUN mkdir -p /root/.puffcoin/testnet3

# Открытие порта (mainnet: 8333, testnet: 18333)
EXPOSE 18333

# Указываем рабочую директорию
WORKDIR /puffcoin/src

# Команда по умолчанию
CMD ["./puffcoind", "-testnet"]
