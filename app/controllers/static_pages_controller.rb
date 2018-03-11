class StaticPagesController < ApplicationController
#This could fix issue with redirect on home page before people fill get there, but we need to reimplement form checking
  skip_before_action :check_login, only: [:home]
  after_action :verify_authorized, only: [:downloadPlacements, :downloadNonParticipants]
  helper_method :pullable_rooms_number

  require 'csv'

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
        logger.debug "DEBUGGING \n\n\n\n\n\n"
        logger.debug student.has_participated
        logger.debug student.status
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

  def create_frosh
    
    if not params[:file].nil?

      # Loop through the rows of the table
      CSV.foreach(params[:file].path, headers: true) do |row|
        row_data = row.to_hash
        dorms = {
          AT: 1,
          CA: 2,
          DW: 3,
          EA: 4,
          LI: 5,
          NO: 6,
          SG: 7,
          SO: 8,
          WE: 9,
        }
        suite_ids = {
          A: 1,
          B: 2,
          C: 3,
          D: 4,
          E: 5,
          F: 6,
        }
        dorms = dorms.stringify_keys
        suite_ids = suite_ids.stringify_keys


        # Get dorm
        dorm_id = dorms[row_data["Dorm"]]
        dorm = Dorm.find(dorm_id)

        # Get room
        room_num = row_data["Room"]
        # If we have a room numer such as 123A, convert to 123.1
        if room_num != room_num.to_i.to_s
          room_num = room_num[0...-1] + "." + suite_ids[room_num[-1]].to_s
        end
        room = Room.find_by dorm: dorm, number: room_num
        room_id = room.attributes['id']

        # Look for existing room assignments for the room
        roomAssignments = RoomAssignment.where(room_id: room_id)

        # If a room assignment exists, delete it!
        if roomAssignments.count != 0
          # Delete a pull associated if one exists
          if not roomAssignments.first.pull_id.nil?
            pull = Pull.find(roomAssignments.first.pull_id) #TODO: Add in source file
            pull.students.each { |student|
              subject = "Pull bumped"
              content = "Your pull has been bumped by an admin."
              GeneralMailer.send_email(student.user, subject, content)
            }
            pull.destroy
          # Else delete all room assignments associated with the room
          else
            roomAssignments.each do |assignment|
              assignment.destroy()
            end
          end
        end

        # Make the RoomAssignment for the frosh
        RoomAssignment.create!(:room_id => room_id, :assignment_type => "frosh")
      end
      flash[:success] = "Frosh rooms successfully added!"
      redirect_to root_path
    end
  end   

end
