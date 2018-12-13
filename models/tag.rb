require('pry')

class Tag

  attr_reader :name

  def initialize(options)
    @name = options['name']
  end

end
