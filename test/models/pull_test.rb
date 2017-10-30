require 'test_helper'

class PullTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
      @p = pulls(:one)
  end

  test "should be valid" do
    assert @p.valid?
  end

end
