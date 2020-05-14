#!/bin/bash

echo "Removing older versions if present";
sudo apt-get remove docker docker-engine docker.io containerd runc;

echo "Updating Packages";
sudo apt-get update -qq && apt-get upgrade -y -qq;

echo "Installing required packages";
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y -qq;

echo "Adding offical GPG key and setting up offical repo";
sudo apt-get install curl -qq;
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add;
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable";

echo "Updating Repositories";
sudo apt-get update -qq;

echo "Installing Docker Engine";
sudo apt-get install docker-ce docker-ce-cli containerd.io -y -qq;

echo "Run test"
sudo docker run hello-world;