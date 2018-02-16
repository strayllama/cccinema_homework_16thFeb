require_relative('../db/sql_runner.rb')
require_relative('customer.rb')

class Film

  attr_reader(:id)
  attr_accessor(:title, :price)

  def initialize(options)
    @id = options['id'].to_i if options['if']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price)
          VALUES ($1, $2)
          RETURNING id;"
    values = [@title, @price]
    film = SqlRunner.run(sql, values)[0]
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films
          SET ('title', 'price') = ($1, $2)
          WHERE id = $3;"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.*
          FROM customers
          INNER JOIN tickets
          ON customers.id = tickets.customer_id
          WHERE tickets.film_id = $1;"
    values = [@id]
    film_customers_array = SqlRunner.run(sql, values)
    film_customers = film_customers_array.map {|customer_hash| Customer.new(customer_hash)}
    return film_customers
  end

  def tickets_sold()
    sql = "SELECT customers.*
          FROM customers
          INNER JOIN tickets
          ON customers.id = tickets.customer_id
          WHERE tickets.film_id = $1;"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.count
  end

# FILMS CLASS METHODS

  def Film.return_all()
    sql = "SELECT * FROM films"
    film_array = SqlRunner.run(sql, [])
    films = film_array.map { |film_hash| Film.new(film_hash)}
    return films

  end

  def Film.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql, [])
  end

end # end CLASS FILM
