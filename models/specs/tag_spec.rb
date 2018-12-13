require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../tag' )

class TagsTest < MiniTest::Test

  def setup
    @groceries = Tag.new({'name' => 'groceries'})
  end

  def test_tag_has_name
    assert_equal('groceries', @groceries.name)
  end

end
