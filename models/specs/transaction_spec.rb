require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../transaction' )
require_relative( '../tag')
require_relative( '../merchant')

class TransactionTest < MiniTest::Test

  def setup
    @transaction = Transaction.new({'id' => 1, 'merchant_id' => 1, 'tag_id' => 1, 'spend' => 25})
  end

  def test_transaction_has_id
    assert_equal(1, @transaction.id)
  end

  def test_transaction_has_merchant_id
    assert_equal(1, @transaction.merchant_id)
  end

  def test_transaction_has_tag_id
    assert_equal(1, @transaction.tag_id)
  end

  def test_transaction_has_spend
    assert_equal(25, @transaction.spend)
  end




end
