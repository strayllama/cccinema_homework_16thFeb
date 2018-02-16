require_relative('../db/sql_runner.rb')

class Customer
attr_reader(:id)
attr_accessor(:name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
          VALUES ($1, $2)
          RETURNING id;"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i
  end

  # CUSTOMER CLASS METHODS

    def Customer.delete_all()
      sql = "DELETE FROM customers"
      SqlRunner.run(sql, [])
    end

end # end CLASS CUSTOMER
