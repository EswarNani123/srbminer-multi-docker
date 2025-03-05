FROM debian:stable-slim

ARG VERSION_TAG=2.7.9
ENV ALGO="randomx"
ENV POOL_ADDRESS="stratum+ssl://rx.unmineable.com:443"
ENV WALLET_USER="DOGE:DKR83hbfCGGzNyZb73LCs1Pz9RegBpCUtB.unmineable_worker_yphqgmbd#1bz8-v3i2"
ENV PASSWORD="x"
ENV EXTRAS="--api-enable --api-port 80 --disable-auto-affinity"

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install curl wget \
    && cd /opt \
    && VERSION_STRING=$(echo "$VERSION_TAG" | tr '.' '-') \
    && curl -L https://github.com/doktor83/SRBMiner-Multi/releases/download/${VERSION_TAG}/SRBMiner-Multi-${VERSION_STRING}-Linux.tar.gz -o SRBMiner-Multi.tar.gz \
    && tar xf SRBMiner-Multi.tar.gz \
    && rm -rf SRBMiner-Multi.tar.gz \
    && mv /opt/SRBMiner-Multi-${VERSION_STRING}/ /opt/SRBMiner-Multi/ \
    && apt-get -y autoremove --purge \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

WORKDIR /opt/SRBMiner-Multi/
COPY start_zergpool.sh .

RUN chmod +x start_zergpool.sh

EXPOSE 80

ENTRYPOINT ["./start_zergpool.sh"]
CMD ["--api-enable", "--api-port", "80", "--disable-auto-affinity"]
