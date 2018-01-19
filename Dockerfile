FROM node:9-alpine

LABEL maintainer ashanaakh@heliostech.fr

ENV BITGO_VERSION 4.18.1

RUN apk update && apk upgrade
RUN apk add --no-cache curl git wget bash bitcoin bitcoin-cli

COPY config/bitcoin.conf /root/.bitcoin/bitcoin.conf

RUN wget https://github.com/BitGo/bitgod/archive/${BITGO_VERSION}.tar.gz
RUN tar -xf ${BITGO_VERSION}.tar.gz

WORKDIR bitgod-${BITGO_VERSION}

RUN npm install

CMD ["./bin/bitgod"]

EXPOSE 19332