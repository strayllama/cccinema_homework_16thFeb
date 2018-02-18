require_relative('../db/sql_runner.rb')
require_relative('film.rb')
require_relative('ticket.rb')

class Customer
attr_reader(:id)
attr_accessor(:name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def buy_ticket(a_screening)
    if a_screening.check_for_seats()
      sql = "SELECT * FROM films WHERE
            id = $1
            ;"
      values = [a_screening.film_id()]
      the_film_hash = SqlRunner.run(sql, values)[0]
      the_film = Film.new(the_film_hash)
      remove_funds(the_film.price())
      Ticket.create_ticket(@id,a_screening.id())
      a_screening.sell_seat()
    else
      return "No seats avalible!"
    end
  end

  def remove_funds(an_amount)
    @funds -= an_amount
    update()
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
          VALUES ($1, $2)
          RETURNING id;"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers
          SET (name, funds) = ($1, $2)
          WHERE id = $3;"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def screenings()
    sql = "SELECT screenings.*
          FROM screenings
          INNER JOIN tickets
          ON screenings.id = tickets.screening_id
          WHERE tickets.customer_id = $1
          ;"
    values = [@id]
    screenings_array = SqlRunner.run(sql, values)
    customer_screenings = screenings_array.map { |screening_hash| Screening.new(screening_hash)}
    return customer_screenings
  end

# now needs to be screenings!!! see above now --^
  # def films()
  #   sql = "SELECT films.*
  #         FROM films
  #         INNER JOIN tickets
  #         ON films.id = tickets.film_id
  #         WHERE tickets.customer_id = $1
  #         ;"
  #   values = [@id]
  #   customer_films_array = SqlRunner.run(sql, values)
  #   customer_films = customer_films_array.map { |film_hash| Film.new(film_hash)}
  #   return customer_films
  # end

  def number_of_tickets()
    sql = "SELECT screenings.*
          FROM screenings
          INNER JOIN tickets
          ON screenings.id = tickets.screening_id
          WHERE tickets.customer_id = $1
          ;"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.count()
  end

# Changed to above--^
  # def number_of_tickets()
  #   sql = "SELECT films.*
  #         FROM films
  #         INNER JOIN tickets
  #         ON films.id = tickets.film_id
  #         WHERE tickets.customer_id = $1
  #         ;"
  #   values = [@id]
  #   tickets = SqlRunner.run(sql, values)
  #   return tickets.count()
  # end

  # CUSTOMER CLASS METHODS

  def Customer.return_all()
    sql = ("SELECT * FROM customers")
    customer_array = SqlRunner.run(sql, [])
    customers = customer_array.map { |customer_hash| Customer.new(customer_hash)}
    return customers
  end

  def Customer.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql, [])
  end

end # end CLASS CUSTOMER
