# volta-docker
An unofficial container for [Volta](https://volta.sh/): The Hassle-Free JavaScript Tool Manager

![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/michaelr0/volta-docker/release.yaml?label=release+build)

![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/michaelr0/volta-docker/nightly.yaml?label=nightly+build)

## Docker Images

- DockerHub https://hub.docker.com/r/michaelr0/volta-docker

```
michaelr0/volta-docker:latest - Ubuntu image, currently built from compiling volta-cli/volta
michaelr0/volta-docker:alpine - Alpine image, currently built from compiling volta-cli/volta
michaelr0/volta-docker:nightly-ubuntu - Ubuntu image, compiled from volta-cli/volta
michaelr0/volta-docker:nightly-alpine - Alpine image, compiled from volta-cli/volta
```

## How to use this image

This image comes preinstalled with Node 20 LTS, but commands such as `npm`, `yarn` should automatically download and use any defined version from your `package.json`

### Basic usage

```shell
$ docker run --rm --interactive --tty \
  --volume $PWD:/app \
  michaelr0/volta-docker <command>
```

### Filesystem permissions
By default, Volta runs as root inside the container. This can lead to permission issues on your host filesystem. You can work around this by running the container with a different user:

```shell
$ docker run --rm --interactive --tty \
  --user $(id -u):$(id -g) \
  --volume $PWD:/app \
  michaelr0/volta-docker <command>
```

See: [https://docs.docker.com/engine/reference/run/#user](https://docs.docker.com/engine/reference/run/#user)⁠ for details.

Note: Docker for Mac behaves differently and this tip might not apply to Docker for Mac users.

## Credits
- [Michael Rook](https://github.com/michaelr0)
- [volta-docker Contributors](https://github.com/michaelr0/volta-docker/graphs/contributors)
- [Volta Team and Contributors](https://github.com/volta-cli/volta/graphs/contributors)
