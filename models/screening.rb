require_relative('../db/sql_runner.rb')
require_relative('film.rb')

class Screening
  attr_reader(:id)
  attr_accessor(:film_id, :showing_time, :avalible_seats)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @showing_time = options['showing_time']
    @avalible_seats = 4
  end

  def save()
    sql = "INSERT INTO screenings
          (film_id, showing_time)
          VALUES ($1, $2)
          RETURNING id;"
    values = [@film_id, @showing_time]
    screening = SqlRunner.run(sql, values)[0]
    @id = screening['id'].to_i
  end

  def update()
    sql = "UPDATE screenings
          SET ('film_id', 'showing_time', 'avalible_seats') = ($1, $2, $3)
          WHERE id = $4;"
    values = [@film_id, @showing_time, @avalible_seats, @id]
    SqlRunner.run(sql, values)
  end

  def check_for_seats()
    return (@avalible_seats != 0)
  end

  def sell_seat() # NEED TO PUT THIS BACK TO THE DATABASE!!!
    @avalible_seats -= 1
  end

  def tickets()
      sql = "SELECT screenings.*
            FROM screenings
            INNER JOIN tickets
            ON  screenings.id = tickets.screening_id
            WHERE tickets.screening_id = $1;"
      values = [@id]
      film_customers_array = SqlRunner.run(sql, values)
      film_customers = film_customers_array.map {|customer_hash| Customer.new(customer_hash)}
      return film_customers
  end


  # SCREENING CLASS METHODS

    def Screening.return_all()
      sql = "SELECT * FROM screenings"
      screening_array = SqlRunner.run(sql, [])
      screenings = screening_array.map { |screening_hash| Screening.new(screening_hash)}
      return screenings
    end

    def Screening.delete_all()
      sql = "DELETE FROM screenings"
      SqlRunner.run(sql, [])
    end

end # end CLASS SCREENING
