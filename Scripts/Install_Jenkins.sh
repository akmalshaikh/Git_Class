#!/bin/bash

echo ========================================================== UPDATING ===========================================================================
sudo yum update –y



echo ====================================== Adding the Jenkins repo using the following command: ===================================================

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

echo ============================= Importing a key file from Jenkins-CI to enable installation from the package: ===================================

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum upgrade

echo "=============================================== Installing Java (Amazon Linux 2023): ==========================================================="

sudo dnf install java-11-amazon-corretto -y

echo ========================================================= Installing Jenkins: ===================================================================

sudo yum install jenkins -y


echo ===================================================================================================================================================


