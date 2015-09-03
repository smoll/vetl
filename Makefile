.DEFAULT_GOAL := all
CURRENT_DIRECTORY := $(shell pwd)

all:
	@make clean
	@make build
	@docker-compose up -d

build:
	@docker-compose build

clean:
	@docker-compose kill
	# Also removes volumes added by the MySQL docker image
	@docker-compose rm -v --force

logs:
	@docker-compose logs

test:
	@docker-compose run test rspec spec/pre-etl
	@docker-compose run etl kiba migrate_users.etl
	# @docker-compose run test rspec spec/post-etl

.PHONY: all build clean logs test
