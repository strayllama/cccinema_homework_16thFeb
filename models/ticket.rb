require_relative('../db/sql_runner.rb')

class Ticket

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
          VALUES ($1, $2)
          RETURNING id
          ;"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values)[0]
    @id = ticket['id'].to_i
  end


  # TICKET CLASS METHODS

    def Ticket.delete_all()
      sql = "DELETE FROM tickets"
      SqlRunner.run(sql, [])
    end

end # end CLASS TICKET
