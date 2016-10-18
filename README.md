# phoenix-boilerplate 🐦

A boilerplate for Phoenix application.

## Overview

### Features

- A fully [Docker](https://www.docker.com/) based
- [Phoenix](http://www.phoenixframework.org/) 1.2.1
- [Nginx](https://hub.docker.com/_/nginx/) (Reverse proxy)
- [MySQL](https://hub.docker.com/_/mysql/) (datastore)
- [Redis](https://hub.docker.com/_/redis/) (Session, PubSub)
- [PhantomJS](http://phantomjs.org/) (Integration Tests)

## Requirements

You need no requirements except for Docker.

## Installation

### Docker

If you don't have docker on your system, install these requirements.  

- Windows

  - [Docker Toolbox](https://www.docker.com/products/docker-toolbox)

- Mac

  - [Docker for Mac](https://docs.docker.com/docker-for-mac/)

Skip this section if docker runtime (`docker` client & server, and `docker-compose`) is already installed.


### Phoenix

- Up and run containers

  ```bash
  make up
  ```

  It's all done.  
  All requirements will be installed automatically.
  
  If you want to install dependencies manually, follow the steps below.
  
  ```
  npm install
  mix deps.get
  ```

- Tests

  ```elixir
  make test
  ```

  Make sure to pass the all tests

- Visit welcome page

  - Docker Toolbox

    http://192.168.99.100/

  - Docker for Mac

    http://localhost/

If something goes wrong, do `make restart` to restart all containers.

## Usage

### up

Run containers or a container

  ```elixir
  make up <name>
  # Up all containers
  make up
  # only mysql server
  make up mysql
  ```

### restart

Restart containers or a container

  ```elixir
  make restart <name>
  # Restart all containers
  make restart
  # Restart only phoenix server
  make restart app
  ```

### kill

Kill containers or a container

  ```elixir
  make kill <name>
  ```


### ps

List containers

  ```elixir
  make ps
  ```

### logs

Fetch the logs of a container

  ```elixir
  make logs <name>
  ```

### build

Build phoenix image for production

  ```elixir
  make build
  ```

You can use these names as a container name.

- `nginx`
- `app`
- `redis`
- `mysql`
- `phantomjs`
- `brunch`

#### Debug

If something goes wrong, you can attach containers directly.

```bash
docker exec -it phoenix_app sh
```

Fetch the logs of a container will also help you.

```
docker logs -f phoenix_app
```

## Deployment

You can easily deploy your Phoenix application onto anywhere docker runtime is installed.


### Test

Test your app before deploy.

```
make test
```

### Build

Build docker image for production.

```
make build
```

it will produce a docker image tagged as `local/phoenix`.

### Push

Pushing an image to [DockerHub](https://hub.docker.com/), or [ECR](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_Console_Repositories.html),


- DockerHub

```
$ docker login
$ docker tag local/phoenix your_name_space/app_name
$ docker push your_name_space/app_name
```

- ECR ([docs](http://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html))

```
$ aws ecr get-login
docker login -u AWS -p password -e none https://aws_account_id.dkr.ecr.us-east-1.amazonaws.com
$ docker login -u AWS -p password -e none https://aws_account_id.dkr.ecr.us-east-1.amazonaws.com
$ docker tag local/phoenix aws_account_id.dkr.ecr.region.amazonaws.com/my-web-app
$ docker push aws_account_id.dkr.ecr.region.amazonaws.com/my-web-app
```

#### Build and Push from CI service

Also you can pushing an image from continuous integration tools.

- CircleCI

  [Continuous Integration and Delivery with Docker \- CircleCI](https://circleci.com/docs/docker/#deployment-to-a-docker-registry)

- TravisCI

  [Using Docker in Builds \- Travis CI](https://docs.travis-ci.com/user/docker/#Pushing-a-Docker-Image-to-a-Registry)

- Wercker

  [wercker \- docs \- Pushing Docker containers](http://devcenter.wercker.com/docs/containers/pushing-containers.html)

### Pull

Pull the image from registry to
[ECS](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_GetStarted.html),  [GKE](https://cloud.google.com/container-engine/), or [Kubernetes](https://github.com/kubernetes/kubernetes), or any other docker infrastructure.
Run the image and now deployment is finished.

See the documentation of each infrastructure will help you.


#### Manually

- DockerHub

```
docker pull your_name_space/app_name
```

- ECR ([docs](http://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-pull-ecr-image.html))

```
docker pull aws_account_id.dkr.ecr.us-east-1.amazonaws.com/my-web-app:latest
```
