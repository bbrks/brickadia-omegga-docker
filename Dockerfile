FROM gameservermanagers/steamcmd:latest

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl git build-essential \
  && apt-get -y autoremove \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && rm -rf /var/tmp/*

RUN curl -sL https://deb.nodesource.com/setup_24.x | bash \
  && apt-get install -y --no-install-recommends nodejs npm \
  && apt-get -y autoremove \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && rm -rf /var/tmp/*

RUN npm i -g omegga

WORKDIR /server

ENTRYPOINT ["omegga"]
