require 'test_helper'

class DormTest < ActiveSupport::TestCase
  def setup
      @dorm = dorms(:one)
  end

  test "should be valid" do
    assert @dorm.valid?
  end

  test "must have a name" do
  	@dorm.name = nil
    assert_not @p.valid?
  end
end
