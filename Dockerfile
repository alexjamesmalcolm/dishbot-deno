FROM python
WORKDIR /builder
ENV QEMU_VERSION qemu-5.1.0-rc3
ADD https://download.qemu.org/${QEMU_VERSION}.tar.xz ./${QEMU_VERSION}.tar.xz
RUN tar xJf ${QEMU_VERSION}.tar.xz
RUN ls
RUN pwd
WORKDIR /builder/${QEMU_VERSION}
RUN ./configure
RUN make
RUN find / -name *qemu*
RUN uname -m
RUN ls /usr/bin
RUN find / -name *qemu*
RUN ls
RUN find / -name *qemu*
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