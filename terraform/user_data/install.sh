#!/bin/bash
set -e

# Update package lists
echo "Updating package lists..."
apt-get update -y

# Install necessary packages
echo "Installing prerequisites..."
apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release

# Install Git
echo "Installing Git..."
apt-get install -y git

# Install Docker
echo "Installing Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker
systemctl start docker
usermod -aG docker ubuntu

# Install Java
echo "Installing Java..."
apt-get install -y openjdk-11-jdk

# Install Maven
echo "Installing Maven..."
apt-get install -y maven

# Install Jenkins
# #echo "Installing Jenkins..."
# #curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
# echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | tee /etc/apt/sources.list.d/jenkins.list > /dev/null
# apt-get update -y
# apt-get install -y jenkins
# systemctl enable jenkins
# systemctl start jenkins

# # Print Jenkins initial admin password
# echo "Jenkins initial admin password:"
# cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Installation complete!"