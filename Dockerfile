FROM arm64v8/python
RUN uname -m
WORKDIR /builder
ENV QEMU_VERSION 5.0.0
ADD https://download.qemu.org/qemu-${QEMU_VERSION}.tar.xz ./qemu-${QEMU_VERSION}.tar.xz
RUN tar xJf qemu-${QEMU_VERSION}.tar.xz
WORKDIR /builder/qemu-${QEMU_VERSION}
RUN ls /usr/bin
RUN ls
RUN ./configure
RUN make
RUN uname -m
RUN ls /usr/bin
RUN ls

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