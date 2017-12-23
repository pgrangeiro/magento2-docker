# Magento 2 Docker environment
This repository contains a Magento 2 complete environment running in Docker containers.

- A container with Magento 2.2.1, PHP 7.0.26 and PHP-FPM
- A container with NGinx for proxy
- A container with Redis for session and page cache
- A container with MySQL 5.7.20
- A container for database backup

## Requirements
- Docker
- Docker Compose

## Install - Resume
In project root folder, do:

1. Copy (and rename) the env file from _devops/_ to project root. Sample for local environment:
```
cp devops/env.local env
```
2. Build the images with the following command:
```
docker-compose build --build-arg ENV=local mysql data web nginx redis
```
3. Up the containers with docker compose:
```
docker-compose up -d
```
4. Run setup script into web container:
```
docker exec name_of_container_web_1 /bin/sh -c "source /scripts/setup.sh"
```
5. It's Done! Your Magento Shop will be running in http://127.0.0.1

## Install - Detailed
After clone this repository, install Docker and Docker Compose in your system.
Then go to project root folder and do the folling setup:

### Copy the env file for your enviroment to project root folder
This project uses env files to deploy different environments. This repository have 2 sample of env files in _devops/_ folder.
This env files contains the environment variables required to build the containers that are described in _docker-compose.yml_ file.
Copy the env file that you want (to project root folder) and rename it to _env_. Sample to build local environment:
```
cp devops/env.local env
```

### Build the images
After setup the env file for your environment, that's time to build the docker images required for your containers. Run the following command, replacing the value of argumment _ENV_ by the environment that you want to build. Sample to build images for local environment:
```
docker-compose build --build-arg ENV=local mysql data web nginx redis
```
Some containers uses different files by environment, so it's necessary to pass the arg _ENV_ to specify that files will be used.

### Up the containers
After build the images, let's get up your containers. Run:
```
docker-compose up -d
```
After that, all containers required for your project will be running. You can check it typing:
```
docker-compose ps
```

### Setup Magento
With your running containers, let's setup your Magento Shop. Run the following command:
```
docker exec name_of_container_web_1 /bin/sh -c "source /scripts/setup.sh"
```
And wait (waiiiiiitt sooo loooong).
This setup script will copy the magento folder from this repository to _/var/www/html_ folder in web container. It also will run the magento command line for your shop first setup. You can see in details in _devops/php/scripts/setup.sh_ file.

### Access your shop!
After run the setup script, you can access your shop by _http://127.0.0.1/_ url. You also can Log In in admin by _http://127.0.0.1/admin/_. The required user and password will be in env file used to built the environment.
