class CreateDorms < ActiveRecord::Migration[5.1]
  def change
    create_table :dorms do |t|
      t.timestamps
    end
  end
end
