FROM node:14.13.1-buster-slim

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sLO https://github.com/watchexec/watchexec/releases/download/cli-v1.17.1/watchexec-1.17.1-aarch64-unknown-linux-gnu.deb \
    && dpkg -i watchexec-1.17.1-aarch64-unknown-linux-gnu.deb \
    && rm -f watchexec-1.17.1-aarch64-unknown-linux-gnu.deb

WORKDIR /app

RUN mkdir -p ./static/dev

COPY postcss.config.js ./postcss.config.js
COPY tailwind.config.js ./tailwind.config.js
COPY package.json ./package.json
COPY yarn.lock ./yarn.lock

RUN yarn install

