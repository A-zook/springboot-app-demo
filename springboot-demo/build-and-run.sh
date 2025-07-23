#!/bin/bash
set -e

# Build the Spring Boot application
echo "Building Spring Boot application with Maven..."
mvn clean package -DskipTests

# Build Docker image
echo "Building Docker image..."
docker build -t springboot-demo:latest .

# Optional: Tag image for a registry
# Uncomment and replace [username] with your Docker Hub username
# docker tag springboot-demo:latest [username]/springboot-demo:latest

# Run the container
echo "Running Docker container..."
docker run -d -p 8080:8080 --name springboot-demo springboot-demo:latest

echo "Application is running at http://localhost:8080"