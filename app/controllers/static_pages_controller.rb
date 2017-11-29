class StaticPagesController < ApplicationController
	helper_method :pullable_rooms_number


	def home
	end

	def dormLookup
		# Get the name of the dorm from the params
		dormName = params[:name]

		# Look up the dorm by the name
		dorm = Dorm.find_by_name(dormName)
		# Redirect to that dorms page
		redirect_to dorm
	end

	def pullable_rooms_number (dorm)
	  if current_user
        if current_user.student
          @drawable_students = Student.where('room_draw_number > ?',current_user.student.room_draw_number).select { |s| s.pull }
          room_id_array = []
          for s in @drawable_students
            for ra in s.pull.room_assignments
              room_id_array.push(Room.find(ra.room_id))
            end
          end
          @p = room_id_array.uniq{|x| x.room_id}.select{|x| Dorm.find(x.dorm_id).name == dorm.name}.count
      end
     end
    end
	
end
