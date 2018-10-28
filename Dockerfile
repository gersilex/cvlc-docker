FROM alpine
RUN apk add --update --no-cache vlc
USER daemon
ENTRYPOINT [ "cvlc" ]
