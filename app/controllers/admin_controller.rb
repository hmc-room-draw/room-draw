class AdminController < ApplicationController
  protect_from_forgery with: :null_session
  after_action :verify_authorized

  def edit_mark
    authorize RoomAssignment

    if params[:create]
      add_mark(params)
    else
      delete_mark(params)
    end
    # Refresh the page so the form can be used again.
    redirect_back fallback_location: root_path, success_message: ""
  end

  def add_mark(params)
    authorize RoomAssignment
    rooms = JSON.parse(params[:room])
    rooms.each do |room_data|
      room_num = room_data["room_num"]
      room = get_room(params[:dorm], room_num)

      # Make sure the user hasn't typed in an invalid room number
      if room.nil?
        flash[:danger] = "Invalid room."
        return
      end
      @marked_room = RoomAssignment.new
      @marked_room.assignment_type = params[:mark_type]
      @marked_room.room_id = room
      @marked_room.description = params[:description]
      @marked_room.save
      if @marked_room.errors.count > 0
        flash[:danger] = @marked_room.errors.full_messages
        return
      end
    end
    flash[:success] = "Rooms successfully marked unpullable."
  end

  def get_room(dorm, room_num)
    dorm_id = Dorm.find_by name: dorm
    room = Room.find_by dorm: dorm_id, number: room_num
    if room.nil?
      return nil
    end
    return room.attributes['id']
  end

  def delete_mark(params)
    rooms = JSON.parse(params[:room])
    rooms.each do |room_data|
      if room_data["pull_id"]
        pull = Pull.find_by(id: room_data["pull_id"])
        if not pull.nil?
          pull.students.each { |student|
            subject = "Pull bumped"
            content = "Your pull has been bumped by an admin."
            GeneralMailer.send_email(student.user, subject, content)
          }
          pull.destroy
        end
      end
      room = get_room(params[:dorm], room_data["room_num"])

      # Delete all rooms with this room_id
      RoomAssignment.where(room_id: room).destroy_all
    end
    flash[:success] = "Rooms successfully deleted."
  end

end
