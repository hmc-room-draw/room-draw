module RoomAssignmentsHelper
  def student_name(room_assignment)
    student = Student.find(room_assignment.student_id)
    user = student.user
    @student_name = user.first_name + " " + user.last_name
  end

  def student_number(room_assignment)
    student = Student.find(room_assignment.student_id)
    @student_number = student.format_number
  end
end
