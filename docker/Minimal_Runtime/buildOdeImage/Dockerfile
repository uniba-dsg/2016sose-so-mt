FROM minimal-runtime-tomcatembedded

MAINTAINER Gabriel Nikol, Michael Traeger

ENV WAR_FILE ./extractedwar

#We are in EmbeddedTomcat dir
#/opt/embeddedTomcat

#-p -> --parrents - but alpine only knows -p
RUN mkdir -p ./webapps/ode
ADD $WAR_FILE ./webapps/ode


#CMD ["java", "-jar", "embeddedTomcat.jar"]


