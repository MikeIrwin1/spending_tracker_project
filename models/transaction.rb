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

end
