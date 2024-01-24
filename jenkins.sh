#!/bin/bash

set -x

# install java11

sudo amazon-linux-extras install java-openjdk11 -y

# install git

sudo yum install git -y

#install jenkins

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo amazon-linux-extras install epel -y
sudo yum install jenkins -y


#install maven

sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven

#Now start jenkins service

systemctl status jenkins
systemctl enable jenkins
systemctl start jenkins
