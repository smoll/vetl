FROM postgres:latest

# See https://github.com/macadmins/postgres
COPY setup-remote-connections.sh /docker-entrypoint-initdb.d/
COPY initial.sql /docker-entrypoint-initdb.d/
