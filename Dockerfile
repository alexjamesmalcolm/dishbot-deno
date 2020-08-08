FROM node

WORKDIR /dishbot
COPY package.json .
COPY package-lock.json .
COPY src .
COPY tsconfig.json .

EXPOSE 3000
ENTRYPOINT [ "npm", "run", "deploy" ]