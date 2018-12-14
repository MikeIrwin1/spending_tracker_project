require('pry')
require_relative( '../db/sql_runner')

class Tag

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tags"
    result = SqlRunner.run(sql)
    return result.map{|tag| Tag.new(tag)}
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Tag.new(result)
  end

  def update
    sql = "UPDATE tags SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sqls, values)
  end

  def merchants()
    sql = "SELECT merchants.* FROM
    merchants INNER JOIN transactions
    ON merchants.id = transactions.merchant_id
    WHERE transactions.tag_id = $1"
    values = [@id]
  end


end
