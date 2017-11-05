require 'test_helper'

class PullTest < ActiveSupport::TestCase
  def setup
      @p = pulls(:one)
  end

  test "should be valid" do
    assert @p.valid?
  end

  test "must belong to a student" do
  	@p.student = nil
    assert_not @p.valid?
  end
end
