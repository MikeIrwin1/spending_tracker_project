require( 'pry' )

class Merchant

  attr_reader :name, :catagory

  def initialize(options)
    @name = options['name']
    @catagory = options['catagory']
  end

end
