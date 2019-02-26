FROM mrchnk/air-sdk:compiler

LABEL description="Dockerized Adobe AIR SDK (compiler + mobile adt packager)"
LABEL maintainer="Nikolay Sukharev <mrchnk@gmail.com>"

WORKDIR /root

# Download AIR SDK for Windows extract compiler bare minimum
RUN curl -fsSL ${AIR_SDK_URL} -o AIRSDK.zip \
  && echo "${AIR_SDK_SHA} *AIRSDK.zip" | sha256sum -c - \
  && unzip AIRSDK.zip \
    lib/nai/* lib/aot/* lib/android/lib/resources/* \
    -d ${AIR_SDK_HOME} \
  && rm AIRSDK.zip

WORKDIR /
