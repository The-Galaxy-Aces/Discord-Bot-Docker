ARG IMAGE=alpine:3.12
FROM $IMAGE

ENV ALPINE_BUILD_PKGS="--virtual .voice-build-deps --no-cache build-base libffi-dev libsodium-dev musl-dev gcc git python3-dev"
ENV ALPINE_REQUIRED_PKGS="--no-cache libffi libsodium opus-dev ffmpeg python3 tmux"

# Clone the TGA-Bot Repo:
RUN apk update
RUN apk add $ALPINE_BUILD_PKGS
RUN apk add $ALPINE_REQUIRED_PKGS

# Install python and upgrade it
RUN ln -sf python3 /usr/bin/python
RUN python -m ensurepip
RUN pip3 install --upgrade pip

# Clone the TGA Discord Bot and install requirements
RUN git clone https://github.com/Travisivart/TGA-Bot.git
WORKDIR /TGA-Bot
RUN pip3 install -r ./requirements.txt

# Remove build packages
RUN apk del .voice-build-deps

# Default command to start the bot
CMD ["python", "./main.py"]