# syntax=docker/dockerfile:experimental
ARG GLOBAL_ARG

FROM ubuntu:bionic AS builder
LABEL description="Multistage docker template"

ADD https://deb.nodesource.com/setup_10.x .
RUN bash setup_10.x && apt install -y nodejs

WORKDIR /apt/folder

RUN mkdir -p -m 0600 ~/ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN --mount=type=ssh,id=default git clone git@github.com:nikistochka/devops.git
# DOCKER_BUILDKIT=1 docker build -t template --ssh default="~/.ssh/idrsa" --file=Multistage.Dockerfile .
# docker build -t template --target builder --file=Multistage.Dockerfile .

RUN build



FROM alpine:3.9

ENV KEY value

USER daemon

VOLUME [ "/data" ]
COPY --from=builder /apt/folder ./
COPY entrypoint.sh ./

EXPOSE 80

ENTRYPOINT ["entrypoint.sh"]
CMD ["parameter_1"]