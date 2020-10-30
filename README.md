# The Galaxy Aces Discord Bot Dockerfile

This dockerfile is provided as an Docker alternative to the manual installation of [The Galaxy Aces Discord Bot](https://github.com/Travisivart/TGA-Bot)

It is also referenced and used as the source of image builds for the [Kubernetes](<>) and [Helm](<>) installations.

While we recommand that if you are not already familiar with building and deploying a docker image, that you refer to the [official documentation](https://docs.docker.com/get-started/part2/), we will provide some basic instructions for building the image and getting it up and running.

## Building Your Own Container

After cloning the repo, you will want to build the image.

```sh
# Build the image
docker build -t tga-discord-bot TGA-Bot
```

## Setup config.yaml

You will now need to create a config.yaml file which is what configures all settings for your discord bots. For a starting point, you can copy the defaults.yaml from [here](https://raw.githubusercontent.com/Travisivart/TGA-Bot/main/defaults.yaml?token=AC3GDATS6OXTVHAHIIC4MOS7TF3RG). Futher details about how to construct your config.yaml and the various settings can be found [here](https://github.com/Travisivart/TGA-Bot#configuration).

Two things to take note of, there are two mounts which you will likely want to use:

-   configPath - Location on the docker host of the config.yaml file you generated above. **This is required**.
-   musicPath - If you are using the local music playback feature of the bot, this needs to point to the location of your local music directory. This can be stored locally or be a network share mounted on the host. If you are not using it, then you can remove both lines regarding the $musicPath.

```sh
# Run with docker
docker run -it --detach --name tga tga-discord-bot

# Mount paths used for docker run below
export configPath="/host/path/to/config.yaml"
export musicPath="/host/path/to/music/"

# Run the container
docker run -it --detach \
--mount type=bind,source="$configPath",target=/TGA-Bot/config.yaml \
--mount type=bind,source="$musicPath",target=/music \
--name tga tga-discord-bot
```

Once the above run command is executed, the bot should boot up and you should see it come online.

## Debugging

As always, it is possible something went wrong. You can check the logs from docker with:

```sh
docker logs tga
```

The logs for a working bot should look something like this:

```sh
The Galaxy Aces Bot enabled features:
  insult
  music
  utility
The Galaxy Aces Bot insult is ready!
The Galaxy Aces Bot music is ready!
The Galaxy Aces Bot utility is ready!
```

You can also execute an interactive shell into the container to further debug any issues.

```sh
docker exec -it tga sh
```
