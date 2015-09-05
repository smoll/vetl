module Helpers
  def mysql
    @mysql ||= Mysql2::Client.new(connect_hash(ENV["MYSQL_URL"]))
  end

  def pg
    @pg ||= PG.connect(ENV["PG_URL"])
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
