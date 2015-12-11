#builds everything

#a single ode-war-file must be contained in ../toLoadOde (name not relevant, only .war as file-ending is important)

echo "---------------------------------"
echo "Building Minimal-Base image stack"

echo "Building Jdk Image"
cd buildJdkImage
sh buildJdkImage.sh
cd ..
echo "Finished Jdk Image"

echo "Building Tomcat Image"
cd buildTomcatImage
sh buildTomcatImage.sh
cd ..
echo "Finished Tomcat Image"

echo "Building ODE Image"
cd buildOdeImage
sh buildOdeImage.sh
cd ..
echo "Finished ODE Image"

echo "Building Example Service Image"
cd buildExampleServiceImage
sh buildExampleServiceImage.sh
cd ..
echo "Finished Example Service Image"

echo "Finished building Minimal-Base image stack"
echo "------------------------------------------"
