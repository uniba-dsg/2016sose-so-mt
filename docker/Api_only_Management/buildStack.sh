#builds everything

#a single ode-war-file must be contained in ../toLoadOde (name not relevant, only .war as file-ending is important)

echo "------------------------------------"
echo "Building API-only-Management image stack"

echo "Building JDK Image"
cd buildJdkImage
sh buildJdkImage.sh
cd ..
echo "Finished JDK Image"

echo "Building Tomcat Embedded with ODE Image"
cd buildTomcatOdeImage
sh buildTomcatOdeImage.sh
cd ..
echo "Finished Tomcat Embedded with ODE Image"

echo "Building Example Process Image"
cd buildExampleServiceImage
sh buildExampleServiceImage.sh
cd ..
echo "Finished Example Process Image"


echo "Finished building API-only-Management image stack"
echo "-----------------------------"
