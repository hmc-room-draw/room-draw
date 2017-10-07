class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.belongs_to :user, index: true
      t.has_one :room

      t.integer :class
      t.integer :room_draw_number
      t.boolean :has_participated

      t.timestamps
    end
  end
end
