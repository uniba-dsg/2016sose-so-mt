docker rmi $(docker images | grep "^<none>" | awk '{print $3}')
#http://jimhoskins.com/2013/07/27/remove-untagged-docker-images.html

