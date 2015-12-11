FROM minimal-base-ode

ENV PROCESS toLoadProcesses

#We are in Catalina-Base
#ENV CATALINA_BASE /usr/share/tomcat7

MAINTAINER Gabriel Nikol, Michael Traeger

ADD $PROCESS ./webapps/ode/WEB-INF/processes

#CMD ["catalina.sh", "run"]
