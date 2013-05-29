class AddButtonFieldsToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :a_button_pressed, :boolean
    add_column :rooms, :b_button_pressed, :boolean
  end
end
