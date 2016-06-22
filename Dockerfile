FROM node:4
MAINTAINER Manuel Klemenz <manuel.klemenz@runit.at>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
                sqlite3 \
                libfontconfig \
                libfontconfig-dev \
        && rm -rf /var/lib/apt/lists/* \
        && npm install -g grunt grunt-cli bower gulp jshint nodemon

RUN useradd -ms /bin/bash newuser
USER newuser
WORKDIR /home/newuser
