docker-air-sdk
==============

Dockerized Adobe AIR SDK. It is available as public image [mrchnk/air-sdk].

Since most of AIR SDK tools written in java and available as jars, there is no
problem to run it in docker container with java support
(I am using `openjdk:8-jre-slim`)

:compiler
---------

Bare minimum container with compiler tools and adt packater for desktop ".air"
apps.

Size: ~150M

:adl
----

Extension over :compiler. It uses wine to run adl.exe. It is available as adl
shell script

Size: ~300M+

:mobile
-------

Another extension over :compiler to package mobile applications for android and
iOS. It contains all the AoT libs and tools. So it's size is much more bigger.

Size: ~400M+

:swissknife
-----------

ant & asconfigc added to :adl
