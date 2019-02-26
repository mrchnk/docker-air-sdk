FROM openjdk:8-jre-slim

LABEL description="Dockerized Adobe AIR SDK (Compiler only)"
LABEL maintainer="Nikolay Sukharev <mrchnk@gmail.com>"

RUN apt-get update && \
  apt-get install -y --no-install-recommends curl && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root

ARG AIRSDK_VERSION=32.0
ARG AIRSDK_URL=http://airdownload.adobe.com/air/win/download/${AIRSDK_VERSION}/AIRSDK_Compiler.zip
ARG AIRSDK_SHA=a69bbfb30302360e76c07d817aa9f59b762b861cd7cdf7d5796fa6e2f30a4769

# Download and extract AIR SDK for MAC
RUN curl -fsSL ${AIRSDK_URL} -o AIRSDK.zip \
  && echo "${AIRSDK_SHA} *AIRSDK.zip" | sha256sum -c - \
  && mkdir /usr/share/AIRSDK \
  && unzip AIRSDK.zip -d /usr/share/AIRSDK \
  && rm AIRSDK.zip

# Add +x to executables
WORKDIR /usr/share/AIRSDK/bin
COPY adt .
RUN chmod +x \
  asdoc compc mxmlc \
  aasdoc acompc amxmlc \
  fdb optimizer swcdepends swfdump \
  adt

# Export PATH and standard AIR environment variables
ENV PATH /usr/share/AIRSDK/bin:${PATH}
ENV AIR_SDK_HOME /usr/share/AIRSDK

# Return to the root
WORKDIR /
