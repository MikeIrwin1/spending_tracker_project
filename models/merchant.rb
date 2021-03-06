require( 'pry' )
require_relative( '../db/sql_runner')

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants (name)
    VALUES ($1)
    RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    results = SqlRunner.run(sql)
    return results.map{|merchant| Merchant.new(merchant)}
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results.first)
  end

  def update()
    sql = "UPDATE merchants SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def tags()
    sql = "SELECT tags.* FROM
    tags INNER JOIN transactions
    ON tags.id = transactions.tag_id
    WHERE transactions.merchant_id = $1"
    values = [@id]
    tags = SqlRunner.run(sql, values)
    return tags.map{|tag| Tag.new(tag)}
  end

  def transactions()
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|transaction| Transaction.new(transaction)}
  end
end
