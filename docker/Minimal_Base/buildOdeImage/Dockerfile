FROM minimal-base-tomcat

MAINTAINER Gabriel Nikol, Michael Traeger

ENV WAR_FILE ./extractedwar

#We are in Catalina-Base
#ENV CATALINA_BASE /usr/share/tomcat7

#-p -> --parrents - but alpine only knows -p
RUN mkdir -p ./webapps/ode
ADD $WAR_FILE ./webapps/ode

#CMD ["catalina.sh", "run"]


