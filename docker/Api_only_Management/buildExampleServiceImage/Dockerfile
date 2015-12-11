FROM api-only-management-tomcatembedded-ode

ENV PROCESS toLoadProcesses

MAINTAINER Gabriel Nikol, Michael Traeger

ADD $PROCESS /opt/embeddedOde/processes
ADD startInContainer.sh /opt/embeddedOde/

WORKDIR /opt/embeddedOde/

CMD ["sh", "startInContainer.sh"]
