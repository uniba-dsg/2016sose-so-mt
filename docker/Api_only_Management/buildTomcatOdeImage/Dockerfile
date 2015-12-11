FROM api-only-management-jdk

MAINTAINER Gabriel Nikol, Michael Traeger

ENV JAR_FILE ./odejarwithdeps

#-p == --parrents - but alpine only knows -p
RUN mkdir -p /opt/embeddedOde
ADD $JAR_FILE /opt/embeddedOde

WORKDIR /opt/embeddedOde

RUN java -jar embeddedOde.jar extract

EXPOSE 8080

CMD ["java", "-jar", "embeddedOde.jar", "start"]
#http://localhost:8080/ für Tomcattest

