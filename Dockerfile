FROM php:7

# grpc.so
RUN apt-get update && apt-get install -y \
    git \
    openssl \
    wget \
    automake \
    autoconf \
    libtool \
    make \
    gcc \
    zlib1g-dev && \
    pecl install -f grpc && \
    docker-php-ext-enable grpc

# grpc_php_plugin
COPY php_start.sh /
RUN chmod 777 /php_start.sh
RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc && \
    cd grpc && \
    git submodule update --init && \
    make grpc_php_plugin && \
    mv bins/opt/protobuf/protoc /usr/local/bin/ && \
    mv bins/opt/grpc_php_plugin /usr/local/bin/ && \
    cd .. && rm -rf grpc

CMD [ "/php_start.sh" ]
