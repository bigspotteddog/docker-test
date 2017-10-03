FROM       centos:centos7

MAINTAINER Bigspotteddog <bink.lynch@gmail.com>

LABEL vendor=Bigspotteddog \
  com.sonatype.license="Apache License, Version 2.0" \
  com.sonatype.name="Bigspotteddog base image"

# configure java runtime
ENV JAVA_HOME=/opt/java \
  JAVA_VERSION_MAJOR=8 \
  JAVA_VERSION_MINOR=144 \
  JAVA_VERSION_BUILD=01 \
  JAVA_DOWNLOAD_HASH=090f390dda5b47b9b721c7dfaa008135

# install Oracle JRE
RUN mkdir -p /opt \
  && curl --fail --silent --location --retry 3 \
  --header "Cookie: oraclelicense=accept-securebackup-cookie; " \
  http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_DOWNLOAD_HASH}/server-jre-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
  | gunzip \
  | tar -x -C /opt \
  && ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} ${JAVA_HOME}

RUN ${JAVA_HOME}/bin/java -version
