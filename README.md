# The Galaxy Aces Discord Bot Dockerfile

This dockerfile is provided as an Docker alternative to the manual installation of [The Galaxy Aces Discord Bot](https://github.com/Travisivart/TGA-Bot)

It is also referenced and used as the source of image builds for the [Kubernetes](<>) and [Helm](<>) installations.

## Building Your Own Container

While we recommand that if you are not already familiar with building and deploying a docker image, that you refer to the [official documentation](https://docs.docker.com/get-started/part2/), we will provide some basic instructions for building the image and getting it up and running.

After cloning the repo, you can build the image by navigating to the base directory of the repo and running:

```sh
# Build the image
docker build -t tga-discord-bot .

# Run with docker
docker run -it --detach --name tga tga-discord-bot

# Exec into the container
docker exec -it tga sh
```

## Setup config.yaml

Once you exec into the running container, you will need to create a config.yaml file and place /TGA-Bot directory. For a starting point, you can copy the defaults.yaml from [here](https://raw.githubusercontent.com/Travisivart/TGA-Bot/main/defaults.yaml?token=AC3GDATS6OXTVHAHIIC4MOS7TF3RG). Futher details about how to construct your config.yaml can be found [here](https://github.com/Travisivart/TGA-Bot#configuration).

## Running the Bot

Once you have placed your config.yaml into the /TGA-Bot directory, you can run the bot using:

```sh
cd /TGA-Bot
python main.py
```
