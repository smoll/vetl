.DEFAULT_GOAL := all
CURRENT_DIRECTORY := $(shell pwd)
RSPEC_OPTS := --color --require spec_helper --format documentation --format RspecJunitFormatter --out spec/reports/

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
	@rm -rf test/spec/reports
	@docker-compose run test rspec spec/pre-etl $(RSPEC_OPTS)pre.xml
	@docker-compose run etl kiba migrate_users.etl
	@docker-compose run test rspec spec/post-etl $(RSPEC_OPTS)post.xml

.PHONY: all build clean logs test
