FROM kitce/xvfb-node:latest

WORKDIR /app
COPY . ./
RUN yarn install --pure-lockfile

CMD ["yarn", "start"]
