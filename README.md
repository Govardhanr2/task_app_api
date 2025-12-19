# 1. Mindmeld Devops Exercise

This exercise is intended to test your knowledge and expertise of devops
tooling and commonly-used AWS products.

In this repository you'll find two directories:

* `api/` -- a simple key-value store API written in Rust
* `app/` -- a simple React frontend to interact with the KV store in a browser

The goal of the exercise is to operate a fully-functioning application stack on
AWS. Availability and resiliency are important, though your implementation does
not need to be overly elaborate. It is more important to demonstrate strong 
principles and opportunities for improvement than it is to build an exhaustive
solution. Be prepared to discuss potential improvements to your solution.

At minimum, you will need to:

* host the API
* host a Redis database for the API to communicate with
* host the frontend application and have it communicate with the API

You are free to choose whichever AWS products/services you believe will best
help you achieve the goal. 

### Implementation 

" To achieve the above, I have Implemented the above task in simplest way which is straight and non exhaustive solution. "

## AWS SETUP using Terraform refer - README.md in terraform folder

Navigate to terraform folder 

command  " cd task_app_api/terraform "

https://github.com/Govardhanr2/task_app_api/blob/main/terraform/README.md#terraform-aws-docker-app-deployment

## Local Setup (Docker Compose) 

This section explains how to run the **task_app_api** application locally using Docker Compose.

## 2. Prerequisites

To successfully run the `task_app_api` project, ensure you have the following:

1. **Docker Installed**
   - Docker and Docker Compose must be installed and running on your local machine.
   - **macOS / Windows:**  
     Install [Docker Desktop](https://www.docker.com/products/docker-desktop).  
     It bundles Docker Engine, Docker CLI, and Docker Compose.
   - **Linux:**  
     Install Docker Engine and the Docker Compose plugin.

2. **Project Files**
   - Ensure you have the complete `task_app_api` project directory.
   - The project must include:
     - `docker-compose.yml`
     - `api/` directory with its `Dockerfile`
     - `app/` directory with its `Dockerfile`

## 2.2. Running the Application

Once Docker is installed and running, follow these steps:

1. Open a terminal or command prompt.
2. Navigate to the root directory of the project (replace the path with your actual location):

   ```bash
   cd /**/**/task_app_api


## 3. Run the Docker Compose Command

To start the application, run the following command in the root directory of your project:
  
  ```bash
 docker-compose up
