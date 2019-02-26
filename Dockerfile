FROM mrchnk/air-sdk:compiler

LABEL description="Dockerized Adobe AIR SDK"
LABEL maintainer="Nikolay Sukharev <mrchnk@gmail.com>"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    xauth \
  && rm -rf /var/lib/apt/lists/*

RUN dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    wine wine32 winbind \
  && rm -rf /var/lib/apt/lists/*

RUN curl -SL 'https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks' -o /usr/local/bin/winetricks \
  && chmod +x /usr/local/bin/winetricks

ENV WINEPREFIX /root/.wine
ENV WINEARCH win32

COPY asound.conf /etc/asound.conf
COPY adl ${AIR_SDK_HOME}/bin/adl
RUN chmod +x ${AIR_SDK_HOME}/bin/adl
