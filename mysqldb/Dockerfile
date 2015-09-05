FROM mysql:latest

COPY bootstrap.sh /docker-entrypoint-initdb.d/

RUN mkdir -p /tmp/sql-bootstrap/
COPY initial.sql /tmp/sql-bootstrap/
