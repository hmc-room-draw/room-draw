class CreateForms < ActiveRecord::Migration[5.1]
  def change
    create_table :forms do |t|
      t.string :currentDorm
      t.string :currentRoom
      t.integer :wifiStrength
      t.string :name
      t.integer :studentID

      t.timestamps
    end
  end
end
