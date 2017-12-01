module RoomAssignmentsHelper
    def student_name(room_assignment)
        student = Student.find(room_assignment.student_id)
        studentuser = User.find(room_assignment.student.id)
        @student_name = studentuser.first_name + " " + studentuser.last_name
    end

    def student_number(room_assignment)
    	student = Student.find(room_assignment.student_id)
    	@student_number = student.class_rank.to_s + " " + student.room_draw_number.to_s
    end

end
