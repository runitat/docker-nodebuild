FROM node:4
MAINTAINER Manuel Klemenz <manuel.klemenz@runit.at>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        cadaver \
        wget \
        curl \
        sqlite3 \
        libfontconfig \
        libfontconfig-dev \
    && rm -rf /var/lib/apt/lists/* \
    && npm set progress=false \
    && npm install -g \
        grunt \
        grunt-cli \
        bower \
        gulp \
        nodemon \
        phantomjs-prebuilt \
        debug

RUN useradd -ms /bin/bash builduser
ENV NODE_ENV="development" \
    NPM_REGISTRY="https://registry.npmjs.org/" \
    NPM_AUTH_TOKEN=""

USER builduser
WORKDIR /home/builduser
