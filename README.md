
## docker-xvfb-node
Normally, Nightmare (or other similar libraries) will not operate properly on headless Linux environment.

Thanks XVFB for providing a "fake" display to the system.

## Usage
```
docker pull kitce/xvfb-node:latest
```
Use it like how you use the official Node.js Docker image.

By the time of writing this image, the latest LTS version of Node.js is 8.11.2, so the base image is `node:8`.

By default, this image "creates" a screen with resolution 800x600 and depth 8 (`800x600x8`).
It can be configured before running a container, see [options](#options) below.

Screen number (`screennum`) and server number will always be `0` and `:99` respectively.
(Nightmare will automatically look for the display on `:99.0`)

## Options
#### `XVFB_SCREEN` (default : `800x600x8`)
Configure the fake display [(Reference)](https://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml)
Append this as the environment variable on `docker run`
#### Example
```
docker run -it -e "XVFB_SCREEN=1024x768x16" my-app:latest

# output
Screen : 1024x768x16
Xvfb is running - pid : 7
> // JavaScript here
```

## Example [(Full example)](https://github.com/kitce/docker-xvfb-node/tree/master/examples)
#### Dockerfile
```
FROM kitce/xvfb-node:latest

WORKDIR /app
COPY . ./
RUN yarn install --pure-lockfile

CMD ["yarn", "start"]
```
#### Build
```
docker build -t duckduckgo:latest .
```
