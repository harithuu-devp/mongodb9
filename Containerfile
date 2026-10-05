FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        curl \
        gnupg \
        ca-certificates \
        wget && \
    rm -rf /var/lib/apt/lists/*

# MongoDB 9 GPG key
RUN curl -fsSL https://pgp.mongodb.com/server-9.asc \
    -o /tmp/server-9.asc && \
    gpg --dearmor \
        -o /usr/share/keyrings/mongodb-server-9.gpg \
        /tmp/server-9.asc && \
    rm /tmp/server-9.asc

# MongoDB 9 repository
RUN echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-9.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/9.0 multiverse" \
    > /etc/apt/sources.list.d/mongodb-org-9.0.list

RUN apt-get update && \
    apt-get install -y mongodb-org && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /data/db

EXPOSE 27017

CMD ["mongod", "--dbpath", "/data/db", "--bind_ip_all", "--port", "27017"]