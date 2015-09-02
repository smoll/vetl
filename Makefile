.DEFAULT_GOAL := all
CURRENT_DIRECTORY := $(shell pwd)

all:
	@docker-compose up -d

build:
	@docker-compose build

# Used by CI
ci:
	make clean
	make
	make test

clean:
	@docker-compose kill
	# Also removes volumes added by the MySQL docker image
	@docker-compose rm -v --force

logs:
	@docker-compose logs

test:
	@docker-compose run test rspec

.PHONY: all build ci clean logs test
