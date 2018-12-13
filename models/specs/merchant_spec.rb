require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../merchant' )

class MerchantTest < MiniTest::Test

  def setup
    @tesco = Merchant.new({'name' => 'Tesco', 'catagory' => 'Supermarket'})
  end

  def test_merchant_has_name
    assert_equal('Tesco', @tesco.name)
  end

  def test_merchant_has_catagory
    assert_equal('Supermarket', @tesco.catagory)
  end

end
