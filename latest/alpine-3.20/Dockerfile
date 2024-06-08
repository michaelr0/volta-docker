FROM rust:alpine AS volta-binaries

WORKDIR /volta

RUN apk add git musl-dev

RUN git clone --depth=1 https://github.com/volta-cli/volta .

RUN cargo build --release

## Build image
FROM alpine AS volta-docker

ARG DEBIAN_FRONTEND=noninteractive

COPY --from=volta-binaries /volta/target/release/volta* /usr/local/bin/

RUN apk add curl

ENV VOLTA_HOME="/opt/volta"
ENV PATH="$VOLTA_HOME/bin:$PATH"

RUN /usr/local/bin/volta setup
RUN /usr/local/bin/volta install node@20

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["volta"]
