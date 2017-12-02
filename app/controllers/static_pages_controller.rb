class StaticPagesController < ApplicationController
	skip_before_action :check_draw_period, only: [:coming_soon]
  after_action :verify_authorized, only: [:downloadPlacements, :downloadNonParticipants]
  helper_method :pullable_rooms_number

	def home
		@draw_period = DrawPeriod.first
		if @draw_period == nil
			@draw_period = DrawPeriod.new
		else
			@start = format_datetime(@draw_period.start_datetime)
			@end = format_datetime(@draw_period.end_datetime)
		end
	end

	def coming_soon
		@draw_period = DrawPeriod.first
        if @draw_period != nil
            @start = format_datetime(@draw_period.start_datetime)
            @end = format_datetime(@draw_period.end_datetime)
        end
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

	def downloadPlacements
	  authorize CSV
		placements_csv = CSV.generate do |csv|
      headings = ["Last Name", "First Name", "Class",
                  "Room Draw Number", "Dorm", "Room", "Preplaced"]
      csv << headings

      Student.all.each do |student|
        user = student.user
        room_assignment = student.room_assignment

        basic_info = [user.last_name, user.first_name,
                      student.class_rank, student.room_draw_number]

        if room_assignment == nil
          placement_info = ["", "", false]
        else
          placement_info = [room_assignment.room.dorm.name,
                            room_assignment.room.number,
                            room_assignment.assignment_type == "preplaced"]
        end

        csv << basic_info + placement_info
      end
		end

		send_data placements_csv,
      :type => 'text/csv',
      :filename => 'placements.csv',
      :disposition => 'attachment'
	end


	def downloadNonParticipants
    authorize CSV
    user_csv = CSV.generate do |csv|
      csv << ["Last Name", "First Name", "Class Rank", "Room Draw Number", "Email"]
      Student.all.each do |student|
        if student.has_participated == false
          user = student.user
          csv << [user.first_name, user.last_name, student.class_rank, student.room_draw_number, user.email]
        end
      end
    end
    send_data user_csv,
      :type => 'text/csv',
      :filename => 'non_participants.csv',
      :disposition => 'attachment'
	end

end
