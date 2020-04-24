# syntax=docker/dockerfile:experimental
FROM alpine:3.9 AS builder
LABEL description="Multistage docker template"

ARG VERSION=1.0

WORKDIR /apt/folder

RUN mkdir -p -m 0600 ~/ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN --mount=type=ssh,id=default git clone git@github.com:nikistochka/devops.git
# docker build -t template --ssh default="~/.ssh/idrsa" --file=Multistage.Dockerfile .

RUN build



FROM alpine:3.9

ENV key=value

USER daemon
VOLUME [ "/data" ]
COPY --from=builder /apt/folder ./

COPY entrypoint.sh ./
EXPOSE 80

ENTRYPOINT ["entrypoint.sh"]
CMD ["parameter_1"]