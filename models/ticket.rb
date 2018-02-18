require_relative('../db/sql_runner.rb')

class Ticket

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @screening_id = options['screening_id']
#    @film_id = options['film_id']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, screening_id)
          VALUES ($1, $2)
          RETURNING id
          ;"
    values = [@customer_id, @screening_id]
    ticket = SqlRunner.run(sql, values)[0]
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE tickets
          SET ('customer_id', 'screening_id') = ($1, $2)
          WHERE id = $3;"
    values = [@customer_id, @screening_id, @id]
    SqlRunner.run(sql, values)
  end

  # TICKET CLASS METHODS

  def Ticket.create_ticket(a_customer_id, a_screening_id)
    new_ticket = Ticket.new({'customer_id' => a_customer_id, 'screening_id' => a_screening_id})
    new_ticket.save()
  end

  def Ticket.return_all()
    sql = "SELECT * FROM tickets"
    tickets_array = SqlRunner.run(sql, [])
    tickets = tickets_array.map { |ticket_hash| Ticket.new(ticket_hash) }
    return tickets
  end

  def Ticket.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql, [])
  end

end # end CLASS TICKET
