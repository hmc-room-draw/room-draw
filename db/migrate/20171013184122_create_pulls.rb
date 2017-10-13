class CreatePulls < ActiveRecord::Migration[5.1]
  def change
    create_table :pulls do |t|
      t.string :message
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
