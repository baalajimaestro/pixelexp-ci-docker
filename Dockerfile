FROM alpine:edge

RUN apk add --no-cache --update \
      git \
      bash \
      curl \
      sudo \
      ca-certificates \
      gcc
     
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH \
    RUST_VERSION=1.42.0

RUN set -eux; \
    url="https://static.rust-lang.org/rustup/archive/1.21.1/x86_64-unknown-linux-musl/rustup-init"; \
    wget "$url"; \
    echo "0c86d467982bdf5c4b8d844bf8c3f7fc602cc4ac30b29262b8941d6d8b363d7e *rustup-init" | sha256sum -c -; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION; \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME;
    
    
RUN git config --global user.email "jhenrique09.mcz@hotmail.com"
RUN git config --global user.name "Henrique Silva"

RUN mkdir /app
WORKDIR /app

RUN curl -sLo Cargo.toml https://raw.githubusercontent.com/PixelExperience/infra_resources/master/ci-linter/Cargo.toml

RUN cargo update

CMD ["bash"]
