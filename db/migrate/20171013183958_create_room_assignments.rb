class CreateRoomAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :room_assignments do |t|
      t.references :student, foreign_key: true
      t.references :pull, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
