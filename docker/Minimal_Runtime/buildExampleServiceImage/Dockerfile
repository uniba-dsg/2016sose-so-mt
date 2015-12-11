FROM minimal-runtime-ode

ENV PROCESS toLoadProcesses

MAINTAINER Gabriel Nikol, Michael Traeger

#We are in EmbeddedTomcat dir
#/opt/embeddedTomcat

ADD $PROCESS ./webapps/ode/WEB-INF/processes

#CMD ["java", "-jar", "embeddedTomcat.jar"]
