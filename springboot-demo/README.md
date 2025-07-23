# Spring Boot Docker Build Guide

This guide explains how to build and run the Spring Boot application using Docker.

## Prerequisites

- Java 17 or later
- Maven
- Docker

## Building and Running with Docker

### Option 1: Using the provided scripts

#### On Windows:
```
.\docker-build.bat
```

#### On Linux/Mac:
```
chmod +x docker-build.sh
./docker-build.sh
```

### Option 2: Manual steps

1. Build the Spring Boot application:
```
mvn clean package -DskipTests
```

2. Build the Docker image:
```
docker build -t springboot-demo:latest .
```

3. Run the Docker container:
```
docker run -p 8080:8080 springboot-demo:latest
```

### Option 3: Using Docker Compose

```
docker-compose up --build
```

## Accessing the Application

Once the container is running, access the application at:
- http://localhost:8080

## Docker Commands Reference

- Stop the container: `docker stop springboot-demo`
- Remove the container: `docker rm springboot-demo`
- List running containers: `docker ps`
- List all containers: `docker ps -a`
- List Docker images: `docker images`