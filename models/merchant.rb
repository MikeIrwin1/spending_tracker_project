require( 'pry' )
require_relative( '../db/sql_runner')

class Merchant

  attr_reader :name, :catagory

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @catagory = options['catagory']
  end

  def save()
    sql = "INSERT INTO merchants (name, catagory)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @catagory]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end


end
