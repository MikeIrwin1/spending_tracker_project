require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../transaction' )
require_relative( '../tag')
require_relative( '../merchant')

class TransactionTest < MiniTest::Test

  def setup
    @tesco = Merchant.new({'name' => 'Tesco', 'catagory' => 'supermarket'})
    @tag = Tag.new({'name' => 'groceries'})
  end

end
