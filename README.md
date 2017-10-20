# Bootstrap Gitlab Runner Service

This project exists to bootstrap a Gitlab Runner Service on a Docker machine.
Just follow the installation instruction below, register your runner and start your continuous integration pipeline with your custom Docker Gitlab runner.

By default it uses the `gitlab/gitlab-runner:latest` image from the offical Docker Hub ([see on docker hub](https://hub.docker.com/r/gitlab/gitlab-runner/)). But you are free to modify the files to your needs.

## Requirements

- Docker
- Docker-compose
- Linux system
- Internet Access

## Modification

### Gitlab Runner Image

If you want to change the Gitlab runner image, or use a custom DTR (Docker Trusted Registry), then edit in the `docker-compose.yml` the line `image: gitlab/gitlab-runner:latest`.

### Installation Directory

If you want to change the default location `/opt/gitlab-runner/` then you will need to edit every file, since only absolute paths are used.

## Installation

1. Copy directory `gitlab-runner` to `/opt/`, so the Makefile, etc are located under `/opt/gitlab-runner`.
2. Run `make install`
    - This will copy the service file to the systemd folder and start the gitlab runner via docker-compose.
    - The service will automatically restarted, when failed, after system restarts, etc.
3. [Register runner](https://docs.gitlab.com/runner/register/):
    - Either run `make register`,
    - or run `docker exec -it <container_name> /bin/bash -c "gitlab-runner register"` and replace `<container_name>` accordingly.
    - You get your specific project token in your project's CI/CD settings on the Gitlab web interface.