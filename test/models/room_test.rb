require 'test_helper'

class RoomTest < ActiveSupport::TestCase

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

  test "should have floor" do
    @room.floor = nil
    assert_not @room.valid?
  end

  test "should have number" do
    @room.number = nil
    assert_not @room.valid?
  end

  test "number should be >= 0" do
    @room.number = -5
    assert_not @room.valid?
  end
end
