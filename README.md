# vetl
POC: Using Docker + RSpec to acceptance test a Kiba ETL

## Why?

Refactoring or replacing legacy ETL code that has poor unit test coverage can be very difficult to do without breaking things. Even when you have good unit test coverage, it can be difficult to know, in an automated fashion, when you have achieved feature parity with your old ETL code.

In this repo, I hope to give a clear example of how one might acceptance test an ETL by:

0. bootstrapping some initial, known data
0. running the ETL against this data
0. validating the final results by expecting the final data to be in a certain state

This effectively mimics the manual process of a Developer running the ETL on some test DB and verifying the results by querying the DB and looking to see if it "looks right."

By using Docker to bootstrap the test DB in a container, we get a number of advantages:

0. no reliance on preexisting servers to be set up, or even having to install MySQL on a real machine/VM
0. avoid truncating tables/inserting data into preexisting tables, which can be extremely brittle and error-prone
0. resetting the data back to the initial state is as simple as destroying & recreating all the containers (which takes only a few seconds)
0. since everything is automated we can run this in a CI server

Acceptance testing, in general, gives us some advantages that unit tests do not:

0. ETL is actually run against a real database
0. we can completely change the ETL code - even use a completely different language! - and if it still works the acceptance tests will continue to pass

at the expense of being slower, and a little further removed from the ETL code itself, of course.

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
