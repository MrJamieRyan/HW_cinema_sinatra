require_relative('../db/sql_runner')
require_relative('./film')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save
    sql = "INSERT INTO customers (name, funds)
          VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM customers"
    data = SqlRunner.run(sql)
    return data.map { |customer| self.new(customer)}
  end

  def update
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql,values)
  end

  def delete
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def tickets
    sql = "SELECT screenings.* FROM screenings
    INNER JOIN tickets ON screenings.id = tickets.screening_id WHERE customer_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    return Film.map_items(film_data).count
  end

  def self.map_items(data)
    result = data.map{|customer| Customer.new(customer)}
    return result
  end

  def funds
    sql = "SELECT funds FROM customers WHERE id = $1"
    values = [@id]
    funds_data = SqlRunner.run(sql, values)[0]
    return funds_data["funds"].to_i
  end

  def buy(film)
    @funds -= film.price
    update
  end

end
