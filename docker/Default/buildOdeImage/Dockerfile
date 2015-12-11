FROM default-tomcat

MAINTAINER Gabriel Nikol, Michael Traeger

ENV WAR_FILE ./extractedwar

#We are in Catalina-Base
#ENV CATALINA_BASE /usr/share/tomcat7

RUN mkdir --parents ./webapps/ode
ADD $WAR_FILE ./webapps/ode

#CMD ["catalina.sh", "run"]


