module RoomAssignmentsHelper
    def student_name(room_assignment)
        student = Student.find(room_assignment.student_id)
        user = User.find(room_assignment.student.id)
        @student_name = user.first_name + " " + user.last_name
    end

    def student_number(pull)
        @student_number = Student.find(room_assignment.student_id).pluck(:class_rank, :room_draw_number)
    end

    def room_name(room_assignment)
    	@room_name = room_assignment.room.number
    	/room = Room.find(room_assignment.room_id)
    	suite = Suite.find(room.suite_id)
    	dorm = Dorm.find(room.dorm_id)
    	room_number = room.number
    	room_floor = room.floor
    	@room_name = dorm + suite + room_floor + room_number/
    end
end