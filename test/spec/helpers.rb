module Helpers
  def mysql
    tries ||= 30 # wait up to 30 seconds for db bootstrap to complete
    @mysql ||= Mysql2::Client.new(connect_hash(ENV["MYSQL_URL"]))
  rescue Mysql2::Error => e
    sleep 1
    retry unless (tries -= 1).zero?
    raise e
  end

  def pg
    tries ||= 5
    @pg ||= PG.connect(ENV["PG_URL"])
  rescue PG::Error => e
    sleep 1
    retry unless (tries -= 1).zero?
    raise e
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
