FROM mrchnk/air-sdk:adl

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    vim gnupg \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y --no-install-recommends nodejs \
  && rm -rf /var/lib/apt/lists/*

RUN npm install --global yarn asconfigc

ENV AIR_SDK ${AIR_SDK_HOME}
