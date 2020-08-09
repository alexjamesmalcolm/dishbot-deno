FROM debian
WORKDIR /builder

ADD https://github.com/balena-io/qemu/releases/download/v4.0.0%2Bbalena2/qemu-4.0.0.balena2-aarch64.tar.gz ./qemu.tar.gz
RUN tar -zxvf qemu.tar.gz
RUN mv qemu-4.0.0+balena2-aarch64/qemu-aarch64-static .

FROM arm64v8/node
WORKDIR /dishbot
EXPOSE 3000

COPY --from=0 /builder/qemu-aarch64-static /usr/bin
COPY package.json .
COPY package-lock.json .
RUN npm clean-install --only=prod

COPY src ./src

ENTRYPOINT [ "npm", "start" ]