module RoomAssignmentsHelper
    def student_name(room_assignment)
        student = Student.find(room_assignment.student_id)
        user = User.find(room_assignment.student.id)
        @student_name = user.first_name + " " + user.last_name
    end

    def student_number(pull)
        @student_number = Student.find(room_assignment.student_id).pluck(:class_rank, :room_draw_number)
    end

end
