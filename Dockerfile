FROM arm32v7/node

EXPOSE 3000

WORKDIR /dishbot
COPY package.json .
COPY package-lock.json .
RUN npm clean-install --only=prod

COPY src ./src

ENTRYPOINT [ "npm", "start" ]