FROM ubuntu:latest
MAINTAINER Sebastian Voss <docker@dev24.de>

ENV JRE_LOCATION http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jre-8u77-linux-x64.tar.gz
ENV JAVA_HOME /opt/jre1.8.0_77
ENV PATH=$PATH:$JAVA_HOME/bin

# install wget
RUN apt-get update && apt-get install -y wget

WORKDIR /opt

# download JRE
RUN wget --output-document jre.tar.gz --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "$JRE_LOCATION" && \
  tar xzf jre.tar.gz && \
  rm jre.tar.gz

CMD ["bash"]