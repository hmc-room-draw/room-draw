class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :floor
      t.string :number
      t.integer :capacity
      t.references :dorm, foreign_key: true
      t.references :suite, foreign_key: true

      t.timestamps
    end
  end
end
