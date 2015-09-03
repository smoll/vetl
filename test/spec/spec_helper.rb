require "byebug"
require "mysql2"
require "pg"
require "uri"

# For math
require "bigdecimal"
require "bigdecimal/util"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
  config.warnings = true
  config.order = :random
  Kernel.srand config.seed
end

def mysql
  @mysql ||= Mysql2::Client.new(connect_hash(ENV["MYSQL_URL"]))
end

def pg
  @pg ||= PG.connect(ENV["PG_URL"])
end

# TODO: move this to a private module method
def connect_hash(url)
  u = URI.parse(url)
  {
    host: u.host,
    username: u.user,
    password: u.password,
    port: u.port,
    database: u.path[1..-1]
  }
end
