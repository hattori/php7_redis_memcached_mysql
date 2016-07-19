# https://hub.docker.com/_/mysql/
FROM mysql:5.7

# setup initial tables
ADD init.sql /docker-entrypoint-initdb.d
