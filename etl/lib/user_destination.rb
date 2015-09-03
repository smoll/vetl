require "pg"

class UserDestination
  # connect_url should look like;
  # postgres://user:pass@localhost/dbname
  def initialize(connect_url)
    @conn = PG.connect(connect_url)
    @conn.prepare("insert_user_stmt", "insert into users (customerName, contactLastName, contactFirstName, country, salesRepEmployeeNumber, creditLimit) values ($1, $2, $3, $4, $5, $6)")
  end

  def write(row)
    time = Time.now
    @conn.exec_prepared("insert_user_stmt",
                        [row[:customerName], row[:contactLastName], row[:contactFirstName], row[:country], row[:salesRepEmployeeNumber], row[:creditLimit]])
  rescue PG::Error => ex
    puts "ERROR for #{row[:customerName]}"
    puts ex.message
    # Maybe, write to db table or file
  end

  def close
    @conn.close
    @conn = nil
  end
end
