require_relative( '../db/sql_runner')

class Budget

  attr_reader :id
  attr_accessor :value

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @value = options['value']
  end

  def save()
    sql = "INSERT INTO budgets (value) VALUES ($1) RETURNING id"
    values = [@value]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM budgets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM budgets"
    results = SqlRunner.run(sql)
    return results.map{|budget| Budget.new(budget)}
  end

  def self.find(id)
    sql = "SELECT * FROM budgets WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Budget.new(result)
  end

  def update
    sql = "UPDATE budgets SET value=$1 WHERE id = $2"
    values = [@value, @id]
    SqlRunner.run(sql, values)
  end

end
