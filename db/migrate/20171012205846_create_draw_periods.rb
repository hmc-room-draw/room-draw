class CreateDrawPeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :draw_periods do |t|
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :last_updated_by

      t.timestamps
    end
  end
end
