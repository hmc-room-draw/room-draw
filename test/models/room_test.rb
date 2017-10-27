require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @room = rooms(:one)
  end

  test "should be valid" do
    assert @room.valid?
  end

  test "should have dorm" do
    @room.dorm = nil
    assert_not @room.valid?
  end
end
