FROM python
WORKDIR /builder
ENV QEMU_VERSION 5.0.0
ADD https://download.qemu.org/qemu-${QEMU_VERSION}.tar.xz ./qemu-${QEMU_VERSION}.tar.xz
RUN tar xJf qemu-${QEMU_VERSION}.tar.xz
RUN ls
RUN pwd
WORKDIR /builder/qemu-${QEMU_VERSION}
RUN ./configure
RUN make
RUN uname -m
RUN ls /usr/bin
RUN ls
RUN ls /usr/bin

# FROM arm64v8/node
# WORKDIR /dishbot
# EXPOSE 3000

RUN uname -m

# COPY --from=0 /builder/qemu-aarch64-static /usr/bin
# COPY package.json .
# COPY package-lock.json .
# RUN npm clean-install --only=prod

# COPY src ./src

# ENTRYPOINT [ "npm", "start" ]