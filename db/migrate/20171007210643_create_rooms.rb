class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.belongs_to :suite, index: true

      t.integer :floor
      t.string :number
      t.integer :capacity

      t.timestamps
    end
  end
end
