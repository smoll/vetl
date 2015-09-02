# See https://github.com/macadmins/postgres

FROM postgres:latest

ENV DB_NAME database
ENV DB_USER admin
ENV DB_PASS password

COPY setup-remote-connections.sh /docker-entrypoint-initdb.d/setup-remote-connections.sh
COPY setup-database.sh /docker-entrypoint-initdb.d/
