FROM minimal-runtime-jdk

MAINTAINER Gabriel Nikol, Michael Traeger

ENV JAR_FILE ./embeddedTomcatJar

RUN mkdir -p /opt/embeddedTomcat
ADD $JAR_FILE /opt/embeddedTomcat

WORKDIR /opt/embeddedTomcat


EXPOSE 8080

CMD ["java", "-jar", "embeddedTomcat.jar"]

