#!bin/bash

sudo docker run --interactive=true --tty=true --publish=8080:8080 minimal-base-ode #/bin/bash
# then open localhost:8080/ode in your browser
