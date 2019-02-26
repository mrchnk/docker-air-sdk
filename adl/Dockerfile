FROM mrchnk/air-sdk:compiler

LABEL description="Dockerized Adobe AIR SDK (compiler + adl debug launcher)"
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

WORKDIR /root

# Download AIR SDK for Windows extract adl runtime
RUN curl -fsSL ${AIR_SDK_URL} -o AIRSDK.zip \
  && echo "${AIR_SDK_SHA} *AIRSDK.zip" | sha256sum -c - \
  && unzip AIRSDK.zip \
    bin/adl.exe runtimes/* \
    -d ${AIR_SDK_HOME} \
  && rm AIRSDK.zip

COPY asound.conf /etc/asound.conf
COPY adl ${AIR_SDK_HOME}/bin/adl
RUN chmod +x ${AIR_SDK_HOME}/bin/adl

WORKDIR /
