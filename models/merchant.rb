require( 'pry' )
require_relative( '../db/sql_runner')

class Merchant

  attr_reader :name, :catagory

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @catagory = options['catagory']
  end

end
