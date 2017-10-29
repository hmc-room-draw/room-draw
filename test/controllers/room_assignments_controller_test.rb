require 'test_helper'

class RoomAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_assignment = room_assignments(:one)
  end

  test "should get index" do
    get room_assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_room_assignment_url
    assert_response :success
  end

  test "should create room_assignment" do
    assert_difference('RoomAssignment.count') do
      post room_assignments_url, params: { room_assignment: { pull_id: @room_assignment.pull_id, room_id: @room_assignment.room_id, student_id: @room_assignment.student_id } }
    end

    assert_redirected_to room_assignment_url(RoomAssignment.last)
  end

  test "should show room_assignment" do
    get room_assignment_url(@room_assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_assignment_url(@room_assignment)
    assert_response :success
  end

  test "should update room_assignment" do
    patch room_assignment_url(@room_assignment), params: { room_assignment: { pull_id: @room_assignment.pull_id, room_id: @room_assignment.room_id, student_id: @room_assignment.student_id } }
    assert_redirected_to room_assignment_url(@room_assignment)
  end

  test "should destroy room_assignment" do
    assert_difference('RoomAssignment.count', -1) do
      delete room_assignment_url(@room_assignment)
    end

    assert_redirected_to room_assignments_url
  end
end
