#!/bin/bash
# Update the package list and upgrade installed packages
sudo apt update && sudo apt upgrade -y

#######################################################
# 	Install Java (required for Jenkins)           #
#######################################################
sudo apt update
sudo apt install openjdk-11-jre
java -version


#######################################################
# 		   Install Jenkins           	      #
#######################################################

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > 

sudo apt-get update
sudo apt-get install jenkins -y

# Start the Jenkins service
sudo systemctl start jenkins

# Enable the Jenkins service to start on boot
sudo systemctl enable jenkins

# Display the initial Jenkins unlock key
echo "Jenkins unlock key:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword



