class AdminController < ApplicationController
  def map
  end

  def edit_mark
    if params[:commit] == "Delete Mark (make pullable)"
      delete_mark(params)
    else
      add_mark(params)
    end
    # Refresh the page so the form can be used again.
    redirect_back fallback_location: root_path, success_message: "hello world"
  end

  def add_mark(params)
    @marked_room = RoomAssignment.new
    @marked_room.assignment_type = params[:mark_type].to_i
    @marked_room.room_id = get_room(params[:dorm_name][:value], params[:room])
    #@marked_room.description = params[:description] - I believe this will be implemented later.
    
    if @marked_room.save
      flash[:success] = "Room successfully marked unpullable."
    else
      flash[:danger] = "Error marking room unpullable."
    end
  end

  def delete_mark(params)
    # Look up the room with the corresponding room ID
    room_id = get_room(params[:dorm_name][:value], params[:room])
    if room_id.nil?
      flash[:success] = "Error - room not found."
    else
      # Delete all rooms with this room_id
      RoomAssignment.where(room_id: room_id).destroy_all
      flash[:success] = "All room assignments associated with this room were successfully deleted."
    end
  end

  def get_room(dorm, room_num)
    dorm_id = Dorm.find_by name: dorm
    room = Room.find_by dorm: dorm_id, number: room_num
    if room.nil?
      return nil
    end
    return room.attributes['id']
  end

end