require( 'pry' )
require_relative( '../db/sql_runner')

class Transaction

  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :spend, :transaction_time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @spend = options['spend'].to_i
    @transaction_time = options['transaction_time']
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, spend)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@merchant_id, @tag_id, @spend]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Transaction.new(result)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    return results.map{|transaction| Transaction.new(transaction)}
  end

  def update()
    sql = "UPDATE transactions SET (merchant_id, tag_id, spend) = ($1, $2, $3)"
    values = [@merchant_id, @tag_id, @spend]
    SqlRunner.run(sql, values)
  end

# This sql replaces the merchant_id and tag_id with the names for display purposes
# unsure how or if to use this yet.

  # "SELECT transactions.id,
  # (SELECT merchants.name FROM merchants WHERE id = transactions.merchant_id),
  # (SELECT tags.name FROM tags WHERE id = transactions.tag_id),
  # transactions.spend,
  # transactions.transaction_time
  # FROM transactions"
end
