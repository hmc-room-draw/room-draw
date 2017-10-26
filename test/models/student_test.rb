require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @user = users(:one)
    @s = students(:one)
    # @s = Student.new(class_rank: "junior", room_draw_number: 53)
  end


  test "should be valid" do
    assert @s.valid?, @s.errors.full_messages
  end

  test "class_rank should be present" do
    @s.class_rank = nil
    assert_not @s.valid?
  end

  test "room_draw_number should be present" do
    @s.room_draw_number = nil
    assert_not @s.valid?
  end

end
