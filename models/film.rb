require_relative('../db/sql_runner.rb')

class Film

  attr_reader(:id)
  attr_accessor(:title, :price)

  def initialize(options)
    @id = options['id'].to_i if options['if']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price)
          VALUES ($1, $2)
          RETURNING id;"
    values = [@title, @price]
    film = SqlRunner.run(sql, values)[0]
    @id = film['id'].to_i
  end

# FILMS CLASS METHODS

  def Film.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql, [])
  end

end # end CLASS FILM
