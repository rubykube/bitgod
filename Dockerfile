FROM node:9

ENV BITGO_VERSION 4.18.1

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y build-essential wget curl

COPY config/bitgod.conf /etc/bitgod.conf

RUN wget https://github.com/BitGo/bitgod/archive/${BITGO_VERSION}.tar.gz
RUN tar -xf ${BITGO_VERSION}.tar.gz

WORKDIR bitgod-${BITGO_VERSION}

RUN npm install

USER node

EXPOSE 19332

CMD ["./bin/bitgod"]

