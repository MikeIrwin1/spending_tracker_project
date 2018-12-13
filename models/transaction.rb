require( 'pry' )
require_relative( '../db/sql_runner')

class Transaction

  attr_reader :id, :merchant_id, :tag_id, :spend

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @spend = options['spend'].to_i
  end
end
