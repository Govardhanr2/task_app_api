# Mindmeld Devops Exercise

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
help you achieve the goal. We expect you to implement a solution using well-
known infrastructure as code tools, though which of those tools you use is
entirely up to you.

When you are finished with the exercise, please submit the configuration for
your solution and any documentation we might need in order to apply that
configuration.

 2. Prerequisites to Execute docker-compose up

To successfully run the task_app_api project using docker-compose up, you need the following:

  2.1. Prerequisites

   1. Install Docker:
       * You must have Docker and Docker Compose installed and running on your local machine.
       * For Mac or Windows: Install Docker Desktop (https://www.docker.com/products/docker-desktop). It bundles the
         Docker Engine, Docker CLI, and Docker Compose.
       * For Linux: Install the Docker Engine and the Docker Compose plugin.

   2. Project Files:
       * Ensure you have the complete task_app_api project folder on your machine, including the docker-compose.yml
         file, and the api and app subdirectories with their respective Dockerfiles.

  2.2. How to Execute

  Once Docker is installed and running, follow these steps:

   1. Open your terminal or command prompt.
   2. Navigate to the root directory of the task_app_api project:
   1     cd task_app_api/
   3. Run the Docker Compose command:
   1     docker-compose up
       * This command will:
           * Pull the redis Docker image.
           * Build the Docker images for the api and app services (using their Dockerfiles).
           * Start all three services (redis, api, app) as interconnected containers.
       * To run the services in the background (detached mode), you can use docker-compose up -d.
       * If you've made changes to the api or app source code and want to rebuild the images, use docker-compose up
         --build.

  You will see the logs from all services directly in your terminal. To stop the running services, press Ctrl+C in the
  terminal where docker-compose up is running.
