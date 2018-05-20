## docker-xvfb-node
Normally, Nightmare (or other similar libraries) will not operate properly on headless Linux environment.

Thanks XVFB for providing a "fake" display to the system.

## Usage
```
docker pull kitce/xvfb-node:latest
```
By the time of writing this image, the latest LTS version of Node.js is 8.11.2, so the base image is `node:8`.

By default, this image "creates" a screen with resolution 800x600 and depth 8 (`800x600x8`).
It can be changed with the environment variable `XVFB_SCREEN` on `docker run` command.

Screen number (`screennum`) and server number will always be `0` and `:99` respectively.
(Nightmare will automatically look for the display on `:99.0`)

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

