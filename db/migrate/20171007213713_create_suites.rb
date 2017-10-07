class CreateSuites < ActiveRecord::Migration[5.1]
  def change
    create_table :suites do |t|
      t.belongs_to :dorm, index: true

      t.timestamps
    end
  end
end
