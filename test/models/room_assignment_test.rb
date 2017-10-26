require 'test_helper'

class RoomAssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def method_name
      @ra = room_assignments(:one)
  end

  test "should be valid" do
    assert @ra.valid?
  end

end
