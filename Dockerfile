FROM gameservermanagers/steamcmd:latest

RUN apt-get update \
  && apt-get install -y --no-install-recommends git build-essential nodejs npm \
  && apt-get -y autoremove \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && rm -rf /var/tmp/*

ARG CACHEBUST=1
RUN npm i -g omegga

WORKDIR /server

ENTRYPOINT ["omegga"]
