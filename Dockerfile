FROM node

WORKDIR /dishbot
COPY package.json .
COPY package-lock.json .
RUN npm clean-install

COPY src .
COPY tsconfig.json .
RUN npm run build
ENTRYPOINT [ "npm", "start" ]