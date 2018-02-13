class ChangeDrawNumberToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :students, :room_draw_number, :decimal, precision: 5, scale:1
  end
end
