FROM openjdk:8-jre-slim

LABEL description="Dockerized Adobe AIR SDK (compiler only)"
LABEL maintainer="Nikolay Sukharev <mrchnk@gmail.com>"

RUN apt-get update && \
  apt-get install -y --no-install-recommends curl ant && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root

ENV AIR_SDK_VERSION=32.0
ENV AIR_SDK_URL=http://airdownload.adobe.com/air/win/download/${AIR_SDK_VERSION}/AIRSDK_Compiler.zip
ENV AIR_SDK_SHA=a69bbfb30302360e76c07d817aa9f59b762b861cd7cdf7d5796fa6e2f30a4769

ENV AIR_SDK_HOME /usr/share/AIRSDK

# Download AIR SDK for Windows extract compiler bare minimum
RUN curl -fsSL ${AIR_SDK_URL} -o AIRSDK.zip \
  && echo "${AIR_SDK_SHA} *AIRSDK.zip" | sha256sum -c - \
  && mkdir ${AIR_SDK_HOME} \
  && unzip AIRSDK.zip \
    -x bin/adl.exe atftools/* runtimes/* lib/win/* lib/win64/* lib/nai/* lib/aot/* lib/android/lib/resources/* \
    -d ${AIR_SDK_HOME} \
  && rm AIRSDK.zip

# Add +x to executables
WORKDIR ${AIR_SDK_HOME}/bin
COPY adt .
RUN chmod +x \
  asdoc compc mxmlc \
  aasdoc acompc amxmlc \
  fdb optimizer swcdepends swfdump \
  adt

# Export PATH and standard AIR environment variables
ENV PATH ${AIR_SDK_HOME}/bin:${PATH}

# Return to the root
WORKDIR /
