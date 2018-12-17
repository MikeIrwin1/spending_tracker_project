require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../budget' )

class BudgetTest < MiniTest::Test

  def setup
    @budget = Budget.new({'budget' => 200})
  end

  def test_budget_has_value
    assert_equal(200, @budget.budget)
  end

end
