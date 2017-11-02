module RoomAssignmentsHelper
    def student_name(room_assignment)
        student = Student.find(room_assignment.student_id)
        @student_name = User.find(student.user_id).pluck(:first_name, :last_name)
    end

    def student_number(pull)
        @student_number = Student.find(room_assignment.student_id).pluck(:class_rank, :room_draw_number)
    end
end