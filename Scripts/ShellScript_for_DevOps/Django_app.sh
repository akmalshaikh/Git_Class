#!/bin/bash

<< Task
Deploying a Django app using this Script
Task

code_clone() {
	echo " Cloning the Django app "
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirements() {
	echo " Downloading the Dependencies "
	sudo apt-get install nginx -y
}

required_restarts() {
	sudo chown $USER /var/run/docker.sock
	sudo systemctl enable docker
	sudo systemctl enable nginx
	sudo systemctl restart docker 
}

deploy() {
	docker build -t notes-app .
	docker run -d -p 8000:8000 notes-app:latest
}


echo "********************** Deployment Started ******************************************"

if ! code_clone; then
	echo " Django-app already exist "
	cd django-notes-app
fi	

if ! install_requirements; then
	echo " Installation failed "
	exit 1
fi
if ! required_restarts; then
	echo " System fault identifield "
	exit 1
fi

deploy

