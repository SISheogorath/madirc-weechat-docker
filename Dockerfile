FROM alpine:3.6

RUN apk add --no-cache weechat tor

RUN adduser -D weechat

USER weechat

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
