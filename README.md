# volta-docker
An unofficial container for [Volta](https://volta.sh/): The Hassle-Free JavaScript Tool Manager

## Docker Images

Source behind the following images:

- DockerHub https://hub.docker.com/r/michaelr0/volta-docker

Docker Hub documentation can be found at https://github.com/docker-library/docs/tree/master/composer

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
