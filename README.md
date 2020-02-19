# Personal Jupyter Docker Recipe

## Build

    $ docker build . -t jupyter

Or

    $ docker-compose build


## Usage

    $ docker run -it -p 8888:8888 -v ${PWD}:/src jupyter [notebook|lab]

Or

    $ docker-compose up


## Environment vars

When using docker-compose you can modify environment variables using a `.env` file at the root of the project.

* `INSTALL_REQUIREMENTS=0`

## New requirements

Add a new line to requirements.txt with the desired requirement.

In order to avoid installing requirements each run you should build the image again.

You can also use `--build` docker-compose option.

    $ docker-compose up --build


---

_1312_
