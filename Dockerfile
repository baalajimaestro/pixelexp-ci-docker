FROM alpine:edge

RUN apk add --no-cache --update \
      git \
      bash \
      curl \
      sudo \
      nodejs \
      npm

RUN git config --global user.email "jhenrique09.mcz@hotmail.com"
RUN git config --global user.name "Henrique Silva"

RUN mkdir /app
WORKDIR /app
RUN npm install glob

CMD ["bash"]
