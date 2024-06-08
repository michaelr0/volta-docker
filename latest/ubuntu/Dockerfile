FROM rust:latest AS volta-binaries

WORKDIR /volta

RUN git clone --depth=1 https://github.com/volta-cli/volta .

RUN cargo build --release

## Build image
FROM ubuntu:24.04 AS volta-docker

ARG DEBIAN_FRONTEND=noninteractive

ENV VOLTA_HOME="/opt/volta"
ENV VOLTA_BIN_PATH="$VOLTA_HOME/bin"
ENV PATH="$VOLTA_BIN_PATH:$PATH"

RUN apt-get update && apt-get install curl -y && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=volta-binaries /volta/target/release/volta* $VOLTA_BIN_PATH/

RUN volta setup
RUN volta install node@20

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["volta"]
