require "byebug"
require "mysql2"
require "pg"
require "uri"

# For math
require "bigdecimal"
require "bigdecimal/util"

# DB client connections in #pg and #mysql
require_relative "helpers"

RSpec.configure do |config|
  config.include Helpers

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
