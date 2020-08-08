FROM arm64v8/node

WORKDIR /dishbot
COPY package.json .
COPY package-lock.json .
RUN npm clean-install

COPY src .
COPY tsconfig.json .
RUN npm run build

RUN rm -rf node_modules
RUN npm clean-install --only=prod

EXPOSE 3000
ENTRYPOINT [ "npm", "start" ]