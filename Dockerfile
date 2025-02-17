FROM python:3.12-alpine

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ARG UID=1000

USER root

RUN addgroup -S posting && adduser -S posting -u $UID -G posting

USER posting

RUN uv tool install --python 3.12 posting

ENV PATH="$PATH:/home/posting/.local/bin"
ENV TERM="xterm-256color"
ENV COLORTERM="truecolor"

WORKDIR /home/posting

ENTRYPOINT [ "posting" ]
