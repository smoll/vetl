require "mysql2"
require "uri"

class UserSource
  # connect_url should look like;
  # mysql://user:password@localhost/dbname
  def initialize(connect_url)
    @mysql = Mysql2::Client.new(connect_hash(connect_url))
  end

  def each
    results = @mysql.query("select * from customers", as: :hash, symbolize_keys: true)
    results.each do |row|
      yield(row)
    end
  end

  private

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
end
