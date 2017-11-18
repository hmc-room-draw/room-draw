module StudentsHelper
    def get_name(student)
    	@name = student.user.first_name + " " + student.user.last_name
    end
end
