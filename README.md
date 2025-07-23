# DevOps Spring Rolls

A complete DevOps project demonstrating CI/CD pipeline with Spring Boot, Docker, and Terraform.

## Project Structure

- **springboot-demo**: Spring Boot application with Docker configuration
- **terraform**: Infrastructure as Code using Terraform to provision AWS resources

## Getting Started

### Prerequisites

- Java 17+
- Maven
- Docker
- Terraform 0.14+
- AWS CLI configured with appropriate credentials

### Running the Spring Boot Application Locally

```bash
cd springboot-demo
mvn spring-boot:run
```

### Building and Running with Docker

```bash
cd springboot-demo
docker build -t springboot-demo .
docker run -p 8080:8080 springboot-demo
```

### Deploying Infrastructure with Terraform

```bash
cd terraform/envs/dev
terraform init
terraform apply
```

## CI/CD Pipeline

This project uses GitHub Actions for CI/CD. The pipeline:

1. Builds the Spring Boot application
2. Runs tests
3. Builds and pushes Docker image to Docker Hub
4. (Optional) Deploys to AWS using Terraform

## Configuration

To use the CI/CD pipeline, add the following secrets to your GitHub repository:

- `DOCKER_HUB_USERNAME`: Your Docker Hub username
- `DOCKER_HUB_TOKEN`: Your Docker Hub access token

## License

This project is licensed under the MIT License - see the LICENSE file for details.