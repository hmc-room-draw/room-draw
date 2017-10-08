class CreateSuites < ActiveRecord::Migration[5.1]
  def change
    create_table :suites do |t|
      t.string :name
      t.references :dorm, foreign_key: true

      t.timestamps
    end
  end
end
