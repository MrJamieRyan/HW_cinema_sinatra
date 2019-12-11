require_relative('../db/sql_runner')
require_relative('./film')

class Screening

  attr_reader :id
  attr_accessor :film_id, :date, :time, :capacity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @date = options['date']
    @time = options['time']
    @capacity = options['capacity'].to_i
  end

  def save
    sql = "INSERT INTO screenings (film_id, date, time, capacity)
          VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@film_id, @date, @time, @capacity]
    screening = SqlRunner.run(sql, values)[0]
    @id = screening['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM screenings"
    data = SqlRunner.run(sql)
    return data.map { |screening| self.new(screening)}
  end

  def update
    sql = "UPDATE screenings SET (film_id, date, time, capacity) = ($1, $2, $3, $4) WHERE id = $4"
    values = [@film_id, @date, @time, @capacity, @id]
    SqlRunner.run(sql,values)
  end

  def delete
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(data)
    result = data.map{|screening| Screening.new(screening)}
    return result
  end

  def tickets_screening
    sql = "SELECT id FROM tickets WHERE screening_id = $1"
    values = [@id]
    ticket_data = SqlRunner.run(sql, values)
    result = Screening.map_items(ticket_data)
    return result.count
  end




end
