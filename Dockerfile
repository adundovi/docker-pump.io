FROM alpine:3.5

LABEL maintainer="adundovi@gmail.com"
LABEL description="Prepares a docker image \
of pump.io server, http://pump.io/."

ENV LC_ALL en_US.UTF-8

RUN apk add --no-cache \
  nodejs \
  git \
  python \
  make \
  g++ \
  graphicsmagick
RUN npm install -g databank-mongodb
RUN npm install -g pump.io
RUN adduser -D -g "" pumpio

# edit pump.io.json before
ADD pump.io.json /etc/

# if SSL is enabled (should be!)
RUN mkdir -p /etc/ssl/private/
COPY privkey.pem /etc/ssl/private/privkey.pem
COPY fullchain.pem /etc/ssl/private/fullchain.pem

VOLUME "/data/uploads"
EXPOSE  443
CMD  ["/usr/bin/pump"]
