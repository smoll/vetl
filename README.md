# vetl
POC: Using RSpec to acceptance test a Kiba ETL

## Usage

### Make targets

0. `make` - Bootstrap the DB with initial data, create all containers.
0. `make test` - Run the acceptance tests.

### Other targets (for development/debugging)

0. `make build` - Build all the docker containers with the latest code in Dockerfiles/images. Use this if the initial `make` errors out and you correct the issue.
0. `make clean` - Clean up any running containers & volumes.
0. `make logs` - View logs from all docker containers.

## TODO

0. ~~bootstrap initial data~~
0. write the acceptance tests
0. write the ETL code

## Credits

Thanks to mbentley for his [docker-mysql bootstrap example](https://github.com/mbentley/docker-db_bootstrap)
