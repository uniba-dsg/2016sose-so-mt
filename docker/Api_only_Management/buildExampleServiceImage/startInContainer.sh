#create a list of directories in processes folder
if [ `find ./processes/ -maxdepth 1 -type d | wc -l` -gt 1 ]; then
	folders=`find ./processes -maxdepth 1 -type d | sed -e '1d'`
else
	echo "######## Error: No process found to start with! ########"
fi

java -jar embeddedOde.jar start $folders
