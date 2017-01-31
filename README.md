SquareScale Containerized Contact Card
=======================================

[![Build Status](https://travis-ci.org/squarescale/contact.svg?branch=master)](https://travis-ci.org/squarescale/contact)

Usage
-----

`$ docker run squarescale/contact`

Build
-----

Build is done inside a docker image, you don't need anything but docker.

`make` display the help with available commands.

Run `make build` to build the executable for linux amd64 arch.

Run `make build-image` to create a docker image containing the executable.

Run `make run-image` after to run the built docker image.

A `make lint` using `dockerfile-lint` from project atomic and `hadoling` is available to check is `Dockerfile` is good.
