require('pry')
require_relative( '../db/sql_runner')

class Tag

  attr_reader :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

end
