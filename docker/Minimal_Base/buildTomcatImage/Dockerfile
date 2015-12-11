FROM minimal-base-jdk

MAINTAINER Gabriel Nikol, Michael Traeger
#adopted from https://github.com/docker-library/tomcat/blob/master/7-jre8/Dockerfile

ENV CATALINA_HOME /usr/share/tomcat7
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME


ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.65
# Before 2015-12-10 release of Tomcat 7.0.67:
# ENV TOMCAT_TGZ_URL http://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
ENV TOMCAT_TGZ_URL http://archive.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

#TODO needed for better performance?
#RUN apt-get update
#RUN apt-get --assume-yes install libtcnative-1 libapr1 libapr1-dev&& \
#  apt-get clean && \
#  rm -rf /var/lib/apt/lists/* /var/tmp/*


#alpine seems to not support tar --strip-components... -> workaround with symlink
RUN wget "$TOMCAT_TGZ_URL" -O tomcat.tar.gz \
  # && tar -xvf tomcat.tar.gz --strip-components=1 \
  # Workaround:	
	&& ln -s . apache-tomcat-$TOMCAT_VERSION && tar xvzf tomcat.tar.gz -C apache-tomcat-$TOMCAT_VERSION && rm apache-tomcat-$TOMCAT_VERSION \
	&& rm bin/*.bat \
	&& rm tomcat.tar.gz*

RUN rm -rf\
	webapps/docs \
	webapps/examples \
	webapps/ROOT \
	webapps/host-manager \
	webapps/manager

EXPOSE 8080

CMD ["catalina.sh", "run"]

