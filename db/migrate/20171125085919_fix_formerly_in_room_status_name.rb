class FixFormerlyInRoomStatusName < ActiveRecord::Migration[5.1]
  def change
    rename_column :emails, :send_to_ready_to_pull, :send_to_formerly_in_room
  end
end
