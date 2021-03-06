require( 'pry' )
require_relative( '../db/sql_runner')

class Transaction

  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :spend, :transaction_time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @spend = options['spend'].to_f
    @transaction_time = options['transaction_time']
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, spend)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@merchant_id, @tag_id, @spend]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.delete(id)
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [id]
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
    sql = "SELECT * FROM transactions ORDER BY transaction_time DESC"
    results = SqlRunner.run(sql)
    return results.map{|transaction| Transaction.new(transaction)}
  end

  def update()
    sql = "UPDATE transactions SET (merchant_id, tag_id, spend) = ($1, $2, $3) WHERE id = $4"
    values = [@merchant_id, @tag_id, @spend, @id]
    SqlRunner.run(sql, values)
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    result = SqlRunner.run(sql, values).first
    return Merchant.new(result)
  end

  def tag()
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [@tag_id]
    result = SqlRunner.run(sql, values).first
    return Tag.new(result)
  end

  def time()
    sql = "SELECT transactions.transaction_time FROM transactions WHERE id = $1"
    values = [@id]
    return SqlRunner.run(sql, values).first['transaction_time'][0..18]
  end
end
