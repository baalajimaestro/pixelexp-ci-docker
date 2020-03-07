FROM alpine:edge

RUN apk add --no-cache --update \
      git \
      bash \
      curl \
      sudo
      
RUN apk add --no-cache --update rust

RUN apk add --no-cache --update cargo

RUN git config --global user.email "jhenrique09.mcz@hotmail.com"
RUN git config --global user.name "Henrique Silva"

RUN mkdir /app
WORKDIR /app

RUN curl -sLo Cargo.toml https://raw.githubusercontent.com/PixelExperience/infra_resources/master/ci-linter/Cargo.toml

RUN cargo update

CMD ["bash"]
