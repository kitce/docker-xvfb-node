

# docker-xvfb-node
Normally, Nightmare (or other similar libraries) will not operate properly on headless Linux environment.

Thanks XVFB for providing a "fake" display to the system.

## Usage
```
docker pull kitce/xvfb-node:latest
```
Use it like how you use the official Node.js Docker image.

By the time of writing this image, the latest LTS version of Node.js is 8.11.2, so the base image is `node:8`.

By default, this image "creates" a screen with resolution 800x600 and depth 8 (`800x600x8`), this can be configured by the environment variable `XVFB_SCREEN`, see [Options](#Options) below.

Screen number (`screennum`) and server number are `0` and `:99` respectively.

This image exports `DISPLAY=":99.0"` to env, Nightmare will then look for the display on `:99.0` automatically.

Screen number and server number will be configurable in the future.

## Options
#### `XVFB_SCREEN` (default : `800x600x8`)
Configure the fake display [(Reference)](https://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml)
Append this as the environment variable on `docker run`
#### Example
```bash
docker run -it -e "XVFB_SCREEN=1024x768x16" my-app:latest
```
#### Output
```bash
Screen : 1024x768x16
Xvfb is running - pid : 7
> // JavaScript here
```

## Example
#### Dockerfile
```dockerfile
FROM kitce/xvfb-node:latest

WORKDIR /app
COPY . ./
RUN yarn install --pure-lockfile

CMD ["yarn", "start"]
```
#### Build
```bash
docker build -t example:latest .
```
[duckduckgo example](https://github.com/kitce/docker-xvfb-node/tree/master/examples)
