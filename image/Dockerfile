FROM alpine:edge

ENV MONGODB_URI="" \
    FTP_SERVER="" \  
    FTP_USERNAME="" \
    FTP_PASSWORD=""  

WORKDIR /app

RUN apk add --no-cache \
    mongodb-tools \
    bash \
    inetutils-ftp && \
    rm /usr/bin/bsondump /usr/bin/mongoexport /usr/bin/mongofiles /usr/bin/mongoimport \
      /usr/bin/mongorestore /usr/bin/mongostat /usr/bin/mongotop && \
    mkdir -p /tmp

COPY backup.sh /app/backup.sh
RUN chmod +x /app/backup.sh

ENTRYPOINT ["/app/backup.sh"]
