FROM mrchnk/air-sdk:compiler

LABEL description="Dockerized Adobe AIR SDK (compiler + asconfigc utility)"
LABEL maintainer="Nikolay Sukharev <mrchnk@gmail.com>"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    vim gnupg \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y --no-install-recommends nodejs \
  && rm -rf /var/lib/apt/lists/*

RUN npm install --global yarn asconfigc
