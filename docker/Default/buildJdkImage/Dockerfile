FROM ubuntu:trusty

MAINTAINER Gabriel Nikol, Michael Traeger

ENV JAVA_VERSION=8 \ 
	JAVA_UPDATE=65 \ 
	JAVA_BUILD=17 \ 
	JAVA_HOME=/usr/lib/jvm/default-jvm

RUN sudo apt-get update && sudo apt-get install --assume-yes wget ca-certificates && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN export PATH=$PATH:$JAVA_HOME/bin

RUN cd /tmp && \
wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" && \
    tar xzf "jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" && \
    mkdir -p /usr/lib/jvm && \
    mv "/tmp/jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle" && \
    ln -s "java-${JAVA_VERSION}-oracle" $JAVA_HOME && \
    ln -s $JAVA_HOME/bin/java /usr/bin/java && \
    ln -s $JAVA_HOME/bin/javac /usr/bin/javac && \
    rm -rf $JAVA_HOME/*src.zip && \
	rm /tmp/* && \
	rm -rf $JAVA_HOME/lib/missioncontrol && \
	rm -rf $JAVA_HOME/lib/visualvm
