require('pg')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'cccinema', host: 'localhost' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure # execute following code no matter what happens
      db.close() if db != nil
    end # end BEGIN
    return result
  end # end RUN

end # end CLASS SQLRUNNER
