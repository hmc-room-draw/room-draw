require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @s = students(:one)
  end

  test "should be valid" do
    assert @s.valid?
  end

  test "class_rank should be present" do
    @s.class_rank = nil
    assert_not @s.valid?
  end

  test "user should be present" do
    @s.user = nil
    assert_not @s.valid?
  end

  test "room_draw_number should be present" do
    @s.room_draw_number = nil
    assert_not @s.valid?
  end
end
