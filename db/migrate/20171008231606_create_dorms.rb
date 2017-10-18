class CreateDorms < ActiveRecord::Migration[5.1]
  def change
    create_table :dorms do |t|
      t.string :name

      t.timestamps
    end
  end
end
