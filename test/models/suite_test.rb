require 'test_helper'

class SuiteTest < ActiveSupport::TestCase
	
  def setup
  	@suite = suites(:one)
  end

  test "should be valid" do
	assert @suite.valid?  	
  end

  test "name should be present" do
  	@suite.name = nil
  	assert_not @suite.valid?
  end

end
