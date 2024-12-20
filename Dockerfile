ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache \
    openjdk11

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /data

# Copy data for add-on
COPY run.sh /
COPY kotlin-dns-1.0-all.jar /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]


