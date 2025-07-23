#!/bin/bash
set -e

echo "Building Spring Boot application with Maven..."
mvn clean package -DskipTests

echo "Building Docker image..."
docker build -t springboot-demo:latest .

echo "Docker build complete!"
echo "To run the container: docker run -p 8080:8080 springboot-demo:latest"