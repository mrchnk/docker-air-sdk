FROM openjdk:jre-slim

LABEL description "Dockerized Adobe AIR SDK"
LABEL maintainer "Nikolay Sukharev <mrchnk@gmail.com>"

RUN apt-get update && apt-get install -y \
        p7zip-full wget

# Download and extract AIR SDK for MAC
WORKDIR /root
RUN wget -q http://airdownload.adobe.com/air/mac/download/32.0/AIRSDK_Compiler.dmg

# dmg archive has some extra data ignore that errors
RUN 7z x AIRSDK_Compiler.dmg -i!AIRSDK_Compiler || exit 0
RUN 7z x AIRSDK_Compiler -i!"AIR SDK" || exit 0
RUN rm AIRSDK_Compiler AIRSDK_Compiler.dmg
RUN mv "AIR SDK" /usr/local/share/AIRSDK

# Add +x to executables
WORKDIR /usr/local/share/AIRSDK/bin
RUN chmod +x \
        asdoc compc mxmlc \
        aasdoc acompc amxmlc \
        fdb optimizer swcdepends swfdump adt

# Export PATH and standard AIR environment variables
ENV PATH /usr/local/share/AIRSDK/bin:${PATH}
ENV AIR_HOME /usr/local/share/AIRSDK

# Return to the root
WORKDIR /