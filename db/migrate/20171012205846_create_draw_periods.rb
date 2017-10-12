class CreateDrawPeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :draw_periods do |t|
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
