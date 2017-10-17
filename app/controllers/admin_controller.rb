class AdminController < ApplicationController
  def map
  end

  def edit_mark
    puts "YAY!!!!! IT GOT CALLED!"
    puts params
    if params[:commit] == "Delete Mark (make pullable)"
      delete_mark(params)
    else
      add_mark(params)
    end
    # Refresh the page so the form can be used again.
    redirect_back fallback_location: root_path
  end

  def add_mark(params)
    marked_room = RoomAssignment.new
    marked_room.assignment_type = mark_type.to_i
    marked_room.room_id = get_room(params[:dorm_name][:value], params[:room])
    marked_room.description = params[:description]
    marked_room.save
  end

  def delete_mark(params)

    puts "AAAAAAA"
    puts Room.column_names
    puts "ZZZZZZZZ"

    # Look up the room with the corresponding room ID
    room_id = get_room(params[:dorm_name][:value], params[:room])
    unless room_id.nil?
      puts "ACTUALLY DELETING"
      # Delete all rooms with this room_id
      RoomAssignment.where(room_id: room_ids[0]).destroy_all
    end
  end

  def get_room(dorm, room_num)
    dorm_id = Dorm.find_by name: dorm
    room_id = Room.find_by dorm: dorm_id, number: room_num
    
    if room_id.nil?
      return nil
    end
    return room_id.key
  end

end