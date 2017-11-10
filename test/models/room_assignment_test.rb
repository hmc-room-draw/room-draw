require 'test_helper'

class RoomAssignmentTest < ActiveSupport::TestCase
  def setup
      @ra = room_assignments(:one)
  end

  test "should be valid" do
    assert @ra.valid?
  end

  test "assignment_type should exist" do
    @ra.assignment_type = nil
    assert_not @ra.valid?
  end
end
